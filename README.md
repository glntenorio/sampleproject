# Sample Project

A small, plain HTML/CSS/JavaScript page used for tester review. There is no framework, no npm dependencies and no build step. Edit the files, refresh the browser, and you are done.

**Live site:** https://fortify-sample.vercel.app

**Playground:** https://fortify-sample.vercel.app/playground

**Instructions for testers:** https://fortify-sample.vercel.app/instructions

**Testers:** read [SETUP.md](SETUP.md) to get set up on your computer, then [TESTERS.md](TESTERS.md) for forking, syncing and pull requests.

## What is inside

```
index.html            The page. The version number lives in the <html data-version> attribute.
playground.html       A sandbox page for testers to experiment on.
instructions.html     The tester walkthrough as a web page (same content as SETUP.md and TESTERS.md).
assets/css/styles.css Mobile-first styles with CSS custom properties.
assets/js/main.js     Optional enhancements: mobile nav toggle, form validation messages.
vercel.json           Static hosting config (clean URLs, no build).
SETUP.md              Environment setup for testers: VS Code, Git, Vercel.
TESTERS.md            Guide for testers: fork, deploy, sync, pull requests.
CHANGELOG.md          What changed in each version.
scripts/              Helper scripts for the maintainer.
.github/              Issue and pull request templates.
```

## Run it locally

Option 1: double-click `index.html` to open it in your browser.

Option 2: serve the folder so paths behave exactly like the live site:

```
npx serve .
```

Then open the URL it prints, usually http://localhost:3000.

## Deploy

The project is connected to Vercel. Every push to `main` deploys to production and every pull request gets its own preview URL. Nothing to configure.

## Reviewing and merging tester changes

Testers send changes as pull requests, either from a fork or, if they have push access, from a branch in this repo. `main` is protected, so nothing reaches the live site until a pull request is merged.

1. Open the **Pull requests** tab. Each one has a **Files changed** tab showing every changed line.
2. Once Vercel is connected to GitHub, the pull request carries a preview link. Open it to see the change running before deciding.
3. To ask for a tweak, leave a comment. The tester pushes more commits to the same branch and the pull request updates on its own.
4. To take it: **Merge pull request**, then **Confirm merge**. Vercel republishes production from `main`. Click **Delete branch** afterwards; the work is in `main` now.
5. To decline: **Close pull request** with a short note saying why. `main` is untouched.

A branch is per change, not per person. Expect several small pull requests from one tester rather than one big one.

## Releasing a new version

1. Update the version in `index.html`, `playground.html` and `instructions.html` in two places each: the `data-version` attribute on `<html>` and the footer `.version__number` text.
2. Add an entry to `CHANGELOG.md`.
3. Commit with a conventional message, for example `feat: add pricing section (v0.2.0)`, and push to `main`.

Testers sync their forks and check the footer to confirm they have the latest version.

## Backups and rollback

Git is the backup, as long as work is pushed. Every commit is a permanent snapshot and every push puts a copy on GitHub. Each tester's fork is a further copy, and Vercel keeps every deployment.

**Habits**

- Commit small and push straight after. Unpushed work is the only work at risk.
- Tag each release so it can be found by name:

  ```
  git tag -a v0.3.0 -m "Release 0.3.0"
  git push origin v0.3.0
  ```

- Branch before a risky change. If it fails, switch back to `main` and delete the branch.
- `main` is protected: no force pushes, no deletion, changes through pull requests.

**Getting something back**

| Situation | Fix |
|---|---|
| Broke a file, not committed yet | VS Code Source Control, hover the file, **Discard Changes** |
| Need an older version of a file | Right-click the file in VS Code, **Open Timeline**, pick the commit. Or **History** on GitHub. |
| Undo a commit that is already pushed | `git revert <commit>` then push. Makes a new commit that cancels the old one; history stays intact. |
| Live site is broken, Git is fine | vercel.com, **Deployments**, pick the last good one, **Promote to Production** |

**Offline copy**

A mirror clone holds every branch and tag. Put it somewhere Time Machine or a cloud drive backs up, and refresh it now and then:

```
git clone --mirror https://github.com/glntenorio/sampleproject.git ~/Backups/sampleproject.git
cd ~/Backups/sampleproject.git && git remote update
```

Not backed up, by design: anything in `.gitignore` (`.env.local`, `.vercel`, `.DS_Store`). Vercel project settings such as the domain live in Vercel, not in the repo.

## Inviting a tester

```
./scripts/invite-tester.sh <github-username>
```

This checks the user exists, grants access, and prints an invite message you can paste into an email or chat. Add `--write` to give the tester push access to this repo so they can clone it directly and push branches; otherwise they work from a fork.
