---
title:      "terraform sa what it is"
date:       2026-10-23T13:12:27-03:00
tags:       ["account", "devops", "sa", "service", "terraform"]
identifier: "20261023T131227"
---

`terraform-sa` is a GCP service account (a robot identity that isn't a person). There is one in each project, and the repo uses it in two ways.

**The accounts**
1. Production: `terraform-sa@pyrecast-448020.iam.gserviceaccount.com`
2. Staging: `terraform-sa@pyrecast-staging.iam.gserviceaccount.com`
3. Development: `terraform-sa@pyrecast-dev.iam.gserviceaccount.com`

**Use 1 - Terraform logs in as it**
1. `terraform/common/providers.tf:3` reads `credentials = file(var.credentials)`.
2. Each env sets the key file, for example `terraform/production/common.tf:4` points at `../service-keys/pyrecast-448020-c59f7511afa2.json`.
3. I checked: the `client_email` in all three key files is that env's `terraform-sa`.

**Use 2 - every VM runs as it**
1. Each VM entry in `terraform/<env>/common.tf` sets `email = "terraform-sa@..."` (for example `terraform/production/common.tf:79`).
2. `terraform/common/vms.tf:54-56` attaches it in the `service_account` block.
3. Code on the VMs (gcloud, the sync timers) gets GCP credentials from this account.

**Its prod roles** (from `gcloud projects get-iam-policy pyrecast-448020`):
- `cloudsql.admin`, `compute.admin`, `compute.networkUser`
- `storage.admin`, `storage.objectAdmin`, `storage.bucketViewer`
- `iam.serviceAccountUser`, `resourcemanager.projectIamAdmin`

**Why the shared account matters:** this is a lot of power for a VM. OAuth scopes cap what the VMs can do with it:
- **App servers:** I checked their scope list at `terraform/common/locals.tf:3-9`. It allows only reading Cloud Storage (`devstorage.read_only`) and writing logs, monitoring and traces. Even though the account is `storage.admin`, an app server can only read buckets.
- **GeoServer VMs:** I didn't check their scope list. If it is broader, a compromised GeoServer VM can act with project-admin rights.
