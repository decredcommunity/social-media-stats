#!/usr/bin/env python3

from os.path import isdir, join
from subprocess import call

def update_subrepo(url, branch, path):
    if isdir(path):
        gitpath = join(path, ".git")
        if isdir(gitpath):
            print("Updating subrepository:", path)
            call(["git", "--git-dir", gitpath, "--work-tree", path,
                  "pull", "--ff-only"])
        else:
            print("Unexpected state: dir '{}' exists but does not contain"
                  " .git dir".format(path))
    else:
        print("Initializing subrepository:", path)
        call(["git", "clone", "--single-branch", "--branch", branch, url,
              path])

REPO = "https://github.com/decredcommunity/social-media-stats.git"

print("Updating root repo")
call(["git", "pull", "--ff-only"])
update_subrepo(REPO, "data", "data")
update_subrepo(REPO, "graphs", "graphs")
