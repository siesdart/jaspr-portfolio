---
name: dart-melos-upgrade
description: Upgrade all packages and dependencies in the Melos monorepo to their latest resolvable versions. Use this skill whenever the user asks to upgrade, update, run outdated, or bump packages or dependencies in this codebase.
metadata:
  model: models/gemini-3.5-flash
  last_modified: Mon, 25 May 2026 05:12:00 GMT
---

# Upgrading Monorepo Dependencies with Melos

This skill provides a systematic and safe workflow for upgrading package dependencies to their latest resolvable versions within a Melos monorepo.

---

## Contents

- [Core Concepts](#core-concepts)
- [Workflow: Upgrading Dependencies](#workflow-upgrading-dependencies)
- [Step 1: Audit Outdated Packages](#step-1-audit-outdated-packages)
- [Step 2: Update pubspec.yaml Constraints](#step-2-update-pubspecyaml-constraints)
- [Step 3: Execute Upgrades and Bootstrap](#step-3-execute-upgrades-and-bootstrap)
- [Step 4: Summarize Results](#step-4-summarize-results)
- [Examples](#examples)

---

## Core Concepts

Understanding the output columns of `melos outdated`:

- **Current:** The version currently resolved and recorded in `pubspec.lock`.
- **Upgradable:** The latest version allowed by the existing constraints in `pubspec.yaml`. These can be updated using a simple upgrade command without editing any files.
- **Resolvable:** The absolute latest version that can be resolved when factoring in all other package constraints in the monorepo. Upgrading to these versions requires editing the constraints in `pubspec.yaml` files.
- **Latest:** The absolute latest published version of the package (excluding prereleases).

---

## Workflow: Upgrading Dependencies

Follow this five-step workflow to perform the dependency upgrade process.

### Step 1: Audit Outdated Packages

First, identify which packages in the monorepo are outdated.

1.  **Run the Audit Command:** Run `melos outdated` in the workspace root.
2.  **Identify Upgrade Candidates:** Focus on dependencies where **Current** is different from **Resolvable**.

### Step 2: Update pubspec.yaml Constraints

Modify the corresponding `pubspec.yaml` files to bump the constraints to match their **Resolvable** versions.

1.  **Locate pubspec.yaml files:** Locate the `pubspec.yaml` for each package or application listed in the audit output.
2.  **Update Dependencies:** Update the version strings of candidate packages under `dependencies` or `dev_dependencies`.
3.  **CRITICAL: Preserve Constraint Prefixes:**
    - Always preserve existing prefixes like caret (`^`) or tilde (`~`) if they were present.
    - _Example:_ If the current entry is `jaspr: ^0.22.0` and the resolvable version is `0.22.2`, update it to `jaspr: ^0.22.2`.
    - _Example:_ If the current entry is `path: 1.8.0` (pinned) and the resolvable version is `1.9.0`, update it to `path: 1.9.0`.

### Step 3: Execute Upgrades and Bootstrap

Resolve the newly modified constraints across the monorepo.

1.  **Run the Upgrade Command:** Run `melos upgrade` to resolve new constraints and update lockfiles.
2.  **Run Bootstrap:** Run `melos bootstrap` to link all local packages and resolve their dependencies.

### Step 4: Summarize Results

Provide a clear and concise summary of the updated dependencies, highlighting:

- Any major or minor version jumps.
- Any unresolved dependencies (e.g., locked by conflicting constraints).

---

## Examples

### Preserving Prefixes in pubspec.yaml

When updating dependencies in any monorepo `pubspec.yaml`:

- **Before:**

  ```yaml
  dependencies:
    http: ^0.13.0
    meta: 1.7.0
  ```

- **Resolvable Versions:**
  - `http`: `0.13.5`
  - `meta`: `1.8.0`

- **After (Correct):**
  ```yaml
  dependencies:
    http: ^0.13.5
    meta: 1.8.0
  ```
