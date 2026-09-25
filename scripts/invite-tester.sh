#!/usr/bin/env bash
#
# invite-tester.sh: check a GitHub user exists, grant access if the repo is
# private, and print a ready-to-send invite message.
#
# Usage: ./scripts/invite-tester.sh [--write] <github-username>

set -euo pipefail

REPO="glntenorio/sampleproject"
LIVE_URL="${LIVE_URL:-https://sampleproject-tau.vercel.app}"

usage() {
  cat <<USAGE
Usage: $(basename "$0") [--write] <github-username>

Checks that the GitHub user exists, grants access, and prints an invite
message to send.

By default a tester gets read access if the repo is private (nothing is
needed if it is public) and works from their own fork. With --write they are
added as a collaborator with push access to this repo instead, so they can
push branches and open pull requests here directly.

Options:
  -w, --write   Add the user as a write collaborator (push access)
  -h, --help    Show this help and exit

Environment:
  LIVE_URL      Override the live site URL in the message (default: $LIVE_URL)
USAGE
}

fail() {
  echo "Error: $*" >&2
  exit 1
}

if [[ $# -eq 0 ]]; then
  usage >&2
  exit 1
fi

WRITE=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    -w|--write)
      WRITE=1
      shift
      ;;
    -*)
      fail "unknown option '$1'. Run with --help."
      ;;
    *)
      break
      ;;
  esac
done

if [[ $# -ne 1 ]]; then
  fail "expected exactly one GitHub username, got $#. Run with --help."
fi

USERNAME="$1"

# GitHub usernames: 1-39 alphanumerics or hyphens, no leading/trailing hyphen.
if ! [[ "$USERNAME" =~ ^[A-Za-z0-9]([A-Za-z0-9-]{0,37}[A-Za-z0-9])?$ ]]; then
  fail "'$USERNAME' is not a valid GitHub username."
fi

command -v gh >/dev/null 2>&1 || fail "gh (GitHub CLI) is not installed. Install with: brew install gh"
gh auth status >/dev/null 2>&1 || fail "gh is not logged in. Run: gh auth login"

echo "Checking that GitHub user '$USERNAME' exists..."
if ! gh api "users/$USERNAME" --jq '.login' >/dev/null 2>&1; then
  fail "GitHub user '$USERNAME' was not found."
fi

VISIBILITY="$(gh repo view "$REPO" --json visibility --jq '.visibility' 2>/dev/null)" \
  || fail "could not read repo '$REPO'. Does it exist and do you have access?"
VISIBILITY="$(echo "$VISIBILITY" | tr '[:upper:]' '[:lower:]')"

if [[ "$WRITE" -eq 1 ]]; then
  echo "Adding '$USERNAME' as a write collaborator (push access)..."
  gh api --method PUT "repos/$REPO/collaborators/$USERNAME" -f permission=push >/dev/null \
    || fail "could not add '$USERNAME' as a collaborator."
  echo "Invitation sent. They must accept it on GitHub (they will get an email) before they can push."
elif [[ "$VISIBILITY" == "private" ]]; then
  echo "Repo is private. Adding '$USERNAME' as a read collaborator..."
  gh api --method PUT "repos/$REPO/collaborators/$USERNAME" -f permission=pull >/dev/null \
    || fail "could not add '$USERNAME' as a collaborator."
  echo "Invitation sent. They must accept it on GitHub before they can fork."
else
  echo "Repo is $VISIBILITY. No collaborator step needed; anyone can fork."
fi

cat <<MESSAGE

---------------- Copy the message below ----------------

Hi @$USERNAME,

Thanks for helping test the sample project. Here is everything you need:

  Project on GitHub: https://github.com/$REPO
  Live site:         $LIVE_URL
  Instructions:      $LIVE_URL/instructions
  Playground:        $LIVE_URL/playground
  Tester guide:      https://github.com/$REPO/blob/main/TESTERS.md

The guide walks you through making your own copy, publishing it on Vercel
(free), editing it, pulling in my updates, and sending changes back.
MESSAGE

if [[ "$WRITE" -eq 1 ]]; then
cat <<MESSAGE

You also have push access to the main repo. Accept the GitHub invitation
from your email first, then you can clone it directly:

  git clone https://github.com/$REPO.git

Make your changes on a new branch and open a pull request. The main branch
is protected, so changes go in through pull requests rather than straight
onto main.
MESSAGE
fi

cat <<MESSAGE

Reply with any questions.

--------------------------------------------------------
MESSAGE
