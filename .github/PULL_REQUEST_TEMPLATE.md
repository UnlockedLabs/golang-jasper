## Pre-Submission PR Checklist

- [ ] No debug statements or leftover development comments
- [ ] All acceptance criteria verified
- [ ] Functions according to **ticket specifications**
- [ ] Image builds locally (`docker build .`) where the Dockerfile or build inputs changed
- [ ] Branch rebased with latest main
- [ ] PR title and every commit are conventional commits (`feat:`, `fix:`, `docs:`...); a squash merge lands under the PR title

## Description of the change

Please provide a brief description of the changes included in this PR.

- **Related issues**: Link to related JIRA ticket that this closes.

## Release

- **Version after merge**: the `v*` tag to push after merging (e.g. `v1.2.3`), or "no release" if the published image is unchanged.
- **Breaking change?**: yes / no. If yes, add `!` to the title (`feat!:`) and list what consumers must change.

## Additional context

Please include additional context or information that the reviewer needs to understand the PR. This includes:

- Known issues that the PR does not address
- What areas to focus on
- What decisions were considered and decided against.
