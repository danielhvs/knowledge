---
title:      "clojure atom swap side effects"
date:       2026-10-12T13:30:10-03:00
tags:       ["clojure", "concurrency"]
identifier: "20261012T133010"
---

# Clojure

## CAC (Check-And-Change) — Concurrency Anti-Pattern with Atoms

### The problem

`swap!` uses CAS (Compare-And-Swap) internally, which means Clojure **retries** the
update function if another thread modified the atom concurrently. If you perform
side-effects (like `reset!` on another atom) inside the swap function, those
side-effects will execute on every retry — even retries whose state change gets
discarded.

### Classic buggy pattern

```clj
(let [accepted? (atom false)]
  (swap! *jobs*
    (fn [jobs]
      (if (can-accept-job? jobs parallelism)
        (do
          (reset! accepted? true)  ;; SIDE-EFFECT — runs on retries too!
          (assoc jobs job-id {:status :processing}))
        jobs)))
  (if @accepted?
    (do-work ...)
    (reject ...)))
```

If `swap!` retries:
1. First attempt: `can-accept-job?` → true → `reset! accepted? true` → CAS fails (another thread won).
2. Retry: `can-accept-job?` → false (slot filled by other thread) → atom unchanged.
3. But `accepted?` is still `true` from the discarded first attempt.
4. Code proceeds as if the job was accepted, but it was never added to `*jobs*`.

### Correct pattern

Keep `swap!`'s function **pure**, then derive your decision from the atom's
committed state after the swap:

```clj
(let [_         (swap! *jobs*
                  (fn [jobs]
                    (if (can-accept-job? jobs parallelism)
                      (assoc jobs job-id {:status :processing})
                      jobs)))
      accepted? (contains? @*jobs* job-id)]
  (if accepted?
    (do-work ...)
    (reject ...)))
```

### Rule

> Never perform side-effects inside a `swap!` function. The function must be pure
> because Clojure may retry it. Derive decisions from the atom state *after* the swap.
