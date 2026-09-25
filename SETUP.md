# Setting up your computer

This guide gets the project running on your own machine so you can edit it in VS Code, save your work to GitHub, and see it live on Vercel. It assumes you have never used these tools. Budget about 30 minutes the first time.

You will end up with this loop:

```
edit in VS Code  ->  commit  ->  push to GitHub  ->  Vercel publishes your site
```

Links you will need:

- The project on GitHub: https://github.com/glntenorio/sampleproject
- The playground page to experiment on: https://fortify-sample.vercel.app/playground
- The tester guide (forking, syncing, pull requests): [TESTERS.md](TESTERS.md)

---

## 1. Install the tools

You need three things installed. All are free.

### Git

Git tracks your changes and talks to GitHub.

- **Mac:** open the **Terminal** app (search for it with Spotlight), type `git --version` and press Enter. If it is not installed, macOS will offer to install the command line tools. Click **Install** and wait.
- **Windows:** download and run the installer from https://git-scm.com/download/win. Accept all the defaults.

Check it worked: open a new terminal (Mac: Terminal, Windows: Git Bash from the Start menu) and run:

```
git --version
```

You should see a version number.

### VS Code

VS Code is the editor. Download it from https://code.visualstudio.com/ and install it.

Once installed, open it and add one extension. Click the **Extensions** icon in the left sidebar (four squares), search for **Live Server** by Ritwick Dey, and click **Install**. This lets you preview the site with automatic refresh.

### Vercel (no install)

Vercel runs in the browser. You do not need to install anything. You just need an account, which section 4 covers.

## 2. Tell Git who you are

Git labels every change with a name and email. Set them once. Open a terminal and run these two lines, using your own details:

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Use the same email you use for GitHub so your changes are linked to your account.

## 3. Get the code onto your computer

### 3a. Make your own copy on GitHub

If you do not have a GitHub account, create one at https://github.com/signup.

Then open https://github.com/glntenorio/sampleproject/fork and click **Create fork**. You now have your own copy at `https://github.com/YOUR-USERNAME/sampleproject`.

If Glen gave you push access instead, skip the fork and use `https://github.com/glntenorio/sampleproject` in the next step.

### 3b. Clone it in VS Code

1. Open VS Code.
2. Open the Command Palette: **Cmd+Shift+P** on Mac, **Ctrl+Shift+P** on Windows.
3. Type `Git: Clone` and press Enter.
4. Paste the URL of your fork, for example `https://github.com/YOUR-USERNAME/sampleproject.git`, and press Enter.
5. Choose a folder to put it in, such as Documents. Click **Select as Repository Destination**.
6. When asked, click **Open**.

The first time, VS Code or Git will ask you to sign in to GitHub. Click **Allow** and follow the browser prompts. This only happens once.

You should now see the project files in the left sidebar: `index.html`, `playground.html`, an `assets` folder and so on.

## 4. See the site locally

Two options. Use whichever you like.

**Option A: Live Server (recommended).** In VS Code, right-click `playground.html` in the sidebar and choose **Open with Live Server**. Your browser opens at an address like `http://127.0.0.1:5500/playground.html`. Every time you save a file, the page refreshes on its own.

**Option B: open the file.** Find the folder in Finder or Explorer and double-click `playground.html`. You will need to refresh the browser yourself after each save.

## 5. Make a change

1. In VS Code, click `playground.html` to open it.
2. Find the line that starts with `<h1>` near the top and change the text.
3. Press **Cmd+S** (Mac) or **Ctrl+S** (Windows) to save.
4. Look at the browser. The heading has changed.

The **Playground** page lists five things to try, from changing a colour to editing JavaScript. Work through them if you like.

## 6. Save your work to GitHub (commit and push)

Saving a file only changes it on your computer. To store it on GitHub and publish it, you commit and push.

1. Click the **Source Control** icon in the left sidebar (it looks like a branch, and shows a number badge when you have changes).
2. You will see your changed files listed. Hover over **Changes** and click the **+** to stage them all.
3. In the **Message** box at the top, type a short note about what you did, such as `Change playground heading`.
4. Click **Commit**.
5. Click **Sync Changes** (or **Publish Branch** the first time). This pushes to GitHub.

Refresh your fork on GitHub and you will see the change and your message.

## 7. Publish on Vercel

You only do this once. After that, every push republishes automatically.

1. Go to https://vercel.com/signup and choose **Continue with GitHub**. Pick the free Hobby plan.
2. Go to https://vercel.com/new.
3. Find `sampleproject` in the list and click **Import**. If you do not see it, click **Adjust GitHub App Permissions** and allow access to the repository.
4. Leave every setting alone and click **Deploy**.
5. After about a minute you get a link to your live site. Open it and add `/playground` to the end to see your playground.

From now on, every time you push in step 6, Vercel rebuilds your site within a minute. Check the **Version** label in the footer to confirm you are seeing the latest build.

## 8. Get Glen's updates

When a new version is released, your fork does not update by itself.

1. On GitHub, open your fork and click **Sync fork**, then **Update branch**.
2. Back in VS Code, open Source Control and click **Sync Changes** (or run `git pull` in the terminal) to bring it down to your computer.

## 9. Undo mistakes

You cannot really break anything. Some common rescues:

| Problem | Fix |
|---|---|
| I changed a file and want it back the way it was | In Source Control, hover the file and click the **Discard Changes** arrow. |
| I want to throw away everything since my last commit | Command Palette, type `Git: Discard All Changes`. |
| I committed something bad and have not pushed | Command Palette, type `Git: Undo Last Commit`. |
| My copy is a mess and I want a fresh start | Delete the folder from your computer and repeat step 3b. Your GitHub fork is untouched. |
| Even my fork is a mess | Delete the fork on GitHub (Settings, scroll to the bottom, **Delete this repository**) and fork again from step 3a. |

## 10. Send changes back or report a bug

See [TESTERS.md](TESTERS.md), sections 6 and 7. In short: open a pull request from your fork, and open an Issue on Glen's repo for bugs.

---

## Glossary

- **Repository (repo):** a project folder that Git tracks. Yours lives on your computer and on GitHub.
- **Fork:** your own copy of someone else's repo on GitHub.
- **Clone:** downloading a repo from GitHub to your computer.
- **Commit:** a saved snapshot of your changes with a message.
- **Push:** sending your commits up to GitHub.
- **Pull / Sync:** bringing changes from GitHub down to your computer.
- **Pull request:** asking the original project to take in your changes.
- **Deploy:** publishing the site so it has a public web address. Vercel does this for you.
