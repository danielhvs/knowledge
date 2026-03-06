# MockitoSettings

controls how strictly Mockito validates your stubbing. There are 3 levels:

  - STRICT_STUBS (default with MockitoExtension) — fails if a stub is unused or if the code calls a stubbed method with different
  arguments than what was set up. This is what caused your error: the tests stub readInt("CS_TIPO_CONSIGNACAO") but mapFieldSet also
  calls readInt("ID_IF") which wasn't stubbed.
  - LENIENT — what initMocks() used to do. No validation on unused stubs or argument mismatches. Unstubbed calls just return defaults
  (0, null, false, etc.).
  - WARN — middle ground, logs warnings instead of failing.

  In your case, LENIENT is needed because the tests only stub the fields they care about, while mapFieldSet reads many more fields. The
  unstubbed readInt calls return 0 by default, which is fine for these tests.

  Ideally, strict stubs are better since they catch mistakes, but that would require stubbing every readInt/readString call that
  mapFieldSet makes — which would add a lot of noise to these focused tests.
