# Tester guide

Welcome, and thanks for helping test. This guide walks you through getting your own copy of the site, editing it, keeping it up to date, and sending changes or bug reports back. You do not need to be a developer. Every step happens in a web browser unless you choose otherwise.

Links you will need:

- The project on GitHub: https://github.com/glntenorio/sampleproject
- The live site: https://sampleproject-tau.vercel.app
- Report a bug: https://github.com/glntenorio/sampleproject/issues/new/choose
- Playground page to experiment on: https://sampleproject-tau.vercel.app/playground
- This guide as a web page: https://sampleproject-tau.vercel.app/instructions
- Full computer setup guide (VS Code, Git, Vercel): [SETUP.md](SETUP.md)

---

## 1. Create your free accounts

You need two free accounts. If you already have them, skip ahead.

1. **GitHub** stores the code. Sign up at https://github.com/signup.
2. **Vercel** publishes the site. Go to https://vercel.com/signup and choose **Continue with GitHub**. Signing up with GitHub means Vercel can see your copies of projects without extra setup. Pick the free Hobby plan.

## 2. Make your own copy (a "fork")

A fork is your personal copy of the project. You can change anything in it without affecting the original.

1. Open https://github.com/glntenorio/sampleproject/fork
2. Leave everything as it is and click **Create fork**.
3. You now have your own copy at `https://github.com/YOUR-USERNAME/sampleproject`.

## 3. Publish your copy on Vercel

1. Go to https://vercel.com/new
2. Under **Import Git Repository**, find `sampleproject` and click **Import**. If you do not see it, click **Adjust GitHub App Permissions** and allow access to the repository.
3. Do not change any settings. Click **Deploy**.
4. After about a minute you will see a **Congratulations** screen with a link to your site. Open it. This is your own live copy.

## 4. Edit the site

There are two ways. Pick whichever feels comfortable.

### Option A: edit in your browser on GitHub

1. Open your fork on GitHub and click the file you want to change, for example `index.html`.
2. Click the pencil icon (**Edit this file**) at the top right.
3. Make your change.
4. Click **Commit changes**, write a short note about what you changed, and click **Commit changes** again.

### Option B: edit on your computer with VS Code

For a full walkthrough with screenshots-level detail, read [SETUP.md](SETUP.md). The short version:

1. Install [Git](https://git-scm.com/downloads) and [VS Code](https://code.visualstudio.com/).
2. On your fork's GitHub page click the green **Code** button and copy the URL.
3. In VS Code open the Command Palette (Cmd+Shift+P or Ctrl+Shift+P), choose **Git: Clone**, paste the URL and pick a folder.
4. Edit the files. Double-click `index.html` to preview it in your browser.
5. When you are happy, go to the **Source Control** panel in VS Code, write a short message, click **Commit**, then **Sync Changes** (or **Push**).

Either way, every time you save a change to your fork, Vercel automatically republishes your site within a minute or so. Refresh your site's URL to see it.

## 5. Get the latest updates from me

When I release a new version, your fork does not update by itself. To pull in my changes:

1. Open your fork on GitHub.
2. Just above the file list you will see a message like **This branch is 3 commits behind glntenorio:main**. Click **Sync fork**.
3. Click **Update branch**.
4. Vercel republishes your site automatically. Refresh it and look at the **Version** number in the footer. It should match the latest version listed in `CHANGELOG.md`.

If GitHub says there is a conflict, it means we both changed the same lines. Click **Discard commits** only if you are fine losing your own changes to that file, otherwise send me a note and I will help.

## 6. Send your changes back to me

When you have made a change you want me to include in the original project:

1. Open your fork on GitHub.
2. Click **Contribute** (just above the file list) and then **Open pull request**.
3. Give it a title, fill in the short template that appears, and click **Create pull request**.
4. I will review it, maybe ask a question or two, and merge it. Once merged, use **Sync fork** (step 5) to bring it back into your copy.

A pull request also gets its own preview link, so I can see your change live before merging.

## 6b. If I gave you push access

Some testers are added as collaborators, which means you can work in my repo directly instead of a fork. You will get an email from GitHub with an invitation. Accept it first.

1. Clone my repo (not a fork):

   ```
   git clone https://github.com/glntenorio/sampleproject.git
   ```

   Or in VS Code: Command Palette, **Git: Clone**, paste that URL.
2. Create a branch for your change. In VS Code, click the branch name in the bottom-left corner and choose **Create new branch**. Give it a short name like `fix-header-spacing`.
3. Edit, commit, and click **Publish Branch** (or **Sync Changes**).
4. GitHub will show a **Compare & pull request** button on the repo page. Click it, fill in the template, and create the pull request.

The `main` branch is protected, so you cannot push to it directly. Every change goes in through a pull request, which also gives it a preview link.

## 7. Report a bug or give feedback

Please report problems on **my** repository, not on your fork, so everything lands in one place.

1. Go to https://github.com/glntenorio/sampleproject/issues/new/choose
2. Choose **Bug report** for something broken, or **Feedback** for ideas and opinions.
3. Fill in the template. Screenshots help a lot: you can drag an image straight into the text box.
4. Click **Submit new issue**.

---

## Quick reference

| I want to... | Do this |
|---|---|
| See my own site | Open the URL Vercel gave you after deploying |
| Change something | Edit a file in your fork on GitHub and commit |
| Get my latest version | Fork page > **Sync fork** > **Update branch** |
| Check which version I have | Look at the **Version** label in the site footer |
| Send a change to me | Fork page > **Contribute** > **Open pull request**, or push a branch and open a pull request if you have push access |
| Report a bug | Open an Issue on my repo using the Bug report template |
