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

## Releasing a new version

1. Update the version in `index.html`, `playground.html` and `instructions.html` in two places each: the `data-version` attribute on `<html>` and the footer `.version__number` text.
2. Add an entry to `CHANGELOG.md`.
3. Commit with a conventional message, for example `feat: add pricing section (v0.2.0)`, and push to `main`.

Testers sync their forks and check the footer to confirm they have the latest version.

## Inviting a tester

```
./scripts/invite-tester.sh <github-username>
```

This checks the user exists, grants access, and prints an invite message you can paste into an email or chat. Add `--write` to give the tester push access to this repo so they can clone it directly and push branches; otherwise they work from a fork.
