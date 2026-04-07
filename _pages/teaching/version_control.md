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
- and of course, your friendly local LLM is absolutely welcome :)

## Before we get started: the command line

Today, we’ll be driving git using *the command line*. In RStudio (or
whichever IDE you’re using), navigate to the *Terminal* window. Welcome
to the command line. Some useful commands:

- pwd: print working directory
- cd: change directories
- mkdir: make directory
- mv: move (a file or files from one location to another)
- cp: copy (a file or files from one location to another)
- touch: create an empty file

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

    cd ~/best_project  # for example
    git init

You can check that you have successfully initialised your repo by
checking its *status*:

    git status

## Our first commit

**Terminology alert!** “commit”: a discrete change to your repository.
Each commit is a snapshot of the repository. We’ll control the changes
that are included in our commits {: .notice–info}

<div class="notice">

<h4>

Terminology alert!
</h4>

<p>

“commit”: a discrete change to your repository. Each commit is a
snapshot of the repository. We’ll control the changes that are included
in our commits
</p>

</div>
