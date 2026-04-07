---
permalink: /teaching/version_control
title: Intro to version control with git and GitHub
categories:
  - howto
tags:
  - R
toc: true
author_profile: false
---

## Preamble

This a workshop I wrote for IDDO’s coding club to introduce complete
beginners to version control with git and the many pros to using GitHub.
During this workshop, we will:

- Learn how to initialise a local repository, how to make commits, and
  how to go back to past versions of our repo
- Learn how to push our repository to GitHub, how to fork a GitHub
  repository, and how to collaborate through pull requests
- Learn some other neat features of GitHub, such as Overleaf integration
  and github.io!

This workshop is for **absolute beginners**. Version control is
confusing! Once you’ve got through the basics, here are some resources
for different skills levels:

- git is my lab book
- and of course, your friendly neighbourhood LLM is absolutely welcome
  :)

## Before we get started: the command line

Today, we’ll be driving git using *the command line*. In RStudio (or
whichever IDE you’re using), navigate to the *Terminal* window. Welcome
to the command line. Some useful commands:

- pwd: print working directory
- cd: change directories
- mkdir: make directory
- mv: move (a file or files from one location to another)
- cp: copy (a file or files from one location to another)
- ls: list all files in a directory
- less: view the contents of a file
- man: show the *manual* for a command, with all the different options
  associated with it, e.g. `man ls`

If you’re unfamiliar, let’s have a quick play around with these. CMD/A
and CMD/E are my favourite command line shortcuts. There are lots of
other commands and interesting ways to use them but we’ll move on for
now!

## Version control: why are we here?

Have you ever found yourself hours or days into a change to a coding or
stats project, only to realise you need to go back? It’s times like
these when **version control** can be very powerful! By tracking your
progress on your code you can:

- go back to specific versions of your code
- track your progress with annotations on each major change to your code
- try out new additions of your code without losing a stable version of
  it
- (and, with a platform like GitHub, allow other people to track your
  progress)

One widely-used system for version control is
[**git**](https://en.wikipedia.org/wiki/Git).

## Our first repository

To make your first repository, navigate to the directory where you would
like it to be located.

{% capture notice-2 %}

#### Repository

AKA “repo”: think of this as a folder where all your code and other
stuff goes. Each repo is a self-contained unit for a single project.

- “Local” repository: the version of your repo on your computer.
- “Remote” repository: the version of your repo on GitHub, for example.
  {% endcapture %}

<div class="notice">

<h4>

Terminology alert!
</h4>

<p>

“repository” or “repo”: think of this as a folder where all your code
and other stuff goes. Each repo is a self-contained unit for a single
project. - “local” repository: the version of your repo on your
computer. - “remote” repository: the version of your repo on GitHub, for
example.
</p>

</div>

Like so:

    mkdir best_project  # for example
    cd best_project  
    git init

You can check that you have successfully initialised your repo by
checking its *status*:

    git status

## Our first commit

There’s nothing in our repo yet! Let’s add a README. This command
creates a file called `README.txt` and puts some text in it

    echo "a very nice readme" > README.txt

Check the status of your repo again. I get:

    On branch main

    No commits yet

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
        README.txt

    nothing added to commit but untracked files present (use "git add" to track)

This tells a couple of important things. We’ll get to branches later,
but importantly, the status message tells us the repo has *no commits
yet*. Let’s remedy that!

**Terminology alert!** “commit”: a discrete change to your repository.
Each commit is a snapshot of the repository. Commits are a two-step
process: 1. Add files to *staging area*. (Or, prepare your snapshot.) 2.
Commit! (Take a photo!) {: .notice–info}

To add files to the staging area, we can use `add`:

``` bash
git add README.txt
```

Check your repo’s status again. Has the README made it to the staging
area?

Now commit:

    git commit -m "my first commit"

The text that follows `-m` is the **commit message**.
