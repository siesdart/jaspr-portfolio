---
name: dart-melos-upgrade
description: Upgrade dependencies in a Dart or Flutter Melos monorepo to the latest mutually resolvable versions when the user asks to upgrade, update, check outdated packages, or bump dependencies.
---

# Upgrade dependencies in a Melos monorepo

Use this workflow from the repository root. Keep dependency constraints intentional, resolve the workspace completely, and report every relevant change or blocker.

## Workflow

### 1. Establish the workspace

Confirm that the current directory is the Melos workspace root and that the repository contains its Melos configuration and package manifests.

Before editing, inspect the working tree and preserve unrelated user changes. Record the starting state of relevant `pubspec.yaml` and lockfiles so the final summary can distinguish this upgrade from pre-existing changes.

Completion criterion: the workspace root, package manifests, Melos configuration, and pre-existing changes are identified.

### 2. Audit outdated dependencies

Run:

```sh
melos outdated
```

Classify each dependency using the audit columns:

- **Current**: the version currently resolved in `pubspec.lock`.
- **Upgradable**: the newest version allowed by the existing constraint.
- **Resolvable**: the newest version that can be resolved with all workspace constraints.
- **Latest**: the newest published stable version, which may not be resolvable in this workspace.

Use **Resolvable** as the default upgrade target. Include a dependency when its **Current** version differs from **Resolvable**. If the audit reports a conflict, an unavailable version, or a package that cannot be upgraded, record it for the final report rather than forcing a constraint.

Completion criterion: every audit entry is classified as upgradeable, already current, or blocked, and the target version for every proposed change is recorded.

### 3. Update dependency constraints

For every proposed change, edit the owning package's `pubspec.yaml`. Update only the relevant dependency entry under `dependencies`, `dev_dependencies`, or another existing dependency section.

Preserve the existing constraint style and intent:

- `^0.22.0` → `^0.22.2`
- `~1.8.0` → `~1.9.0`
- `1.8.0` → `1.9.0`
- Keep path, git, hosted, SDK, and other non-version sources unchanged unless the audit explicitly identifies them as the target.

Do not replace a constraint with the **Latest** version merely because it is newer. If a constraint must be widened or a major version must be adopted, explain the reason and assess the resulting compatibility impact before making that edit.

Completion criterion: every intended `Current` → `Resolvable` change is present in the correct manifest, all existing constraint prefixes and sources are preserved, and no unrelated manifest content changed.

### 4. Resolve and bootstrap the workspace

Resolve the edited constraints and update lockfiles:

```sh
melos upgrade
```

Then link local packages and complete workspace setup:

```sh
melos bootstrap
```

If either command fails, inspect the resolver output, identify the conflicting package or constraint, and report the blocker. Apply another manifest edit only when it is directly required to resolve the requested upgrade and its impact is understood.

Completion criterion: both commands complete successfully, or the exact failing command, package, and resolver reason are captured.

### 5. Verify the result

Inspect the resulting diff and confirm that:

- each requested dependency is resolved at the intended version;
- lockfiles and manifests agree with the resolution;
- local packages remain linked correctly;
- no unrelated files or dependency changes were introduced.

Run the repository's existing validation commands when they are discoverable and relevant, such as the package tests, analyzer, or formatter checks. Do not invent project-specific commands when no established command is present.

Completion criterion: the final diff has been reviewed, every target dependency has a verified outcome, and validation results or validation blockers are recorded.

## Final report

Summarize:

- changed dependencies with `old → new` versions and owning packages;
- major or minor version jumps and any compatibility concerns;
- validation commands and their outcomes;
- dependencies that remained unchanged or were blocked, including the resolver reason;
- files changed by the upgrade.

Separate pre-existing changes from changes made during this workflow.

## Constraint example

Given:

```yaml
dependencies:
  http: ^0.13.0
  meta: 1.7.0
```

and these **Resolvable** versions:

```text
http: 0.13.5
meta: 1.8.0
```

update to:

```yaml
dependencies:
  http: ^0.13.5
  meta: 1.8.0
```
