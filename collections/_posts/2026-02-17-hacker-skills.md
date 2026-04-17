---
date: 2026-02-16 12:00:00 +3000
title: "Hacker Skills: Using Your Keyboard More Efficiently"
description: "Going beyond Ctrl-C and Ctrl-V to make daily work faster."
tags: [memos]
image: /assets/posts/hacker-skills/cover.png
---

I’ve always admired people who live almost entirely on their keyboard. I was the first in my circle to master **Ctrl-C** and **Ctrl-V** 😎. Add **Ctrl-X** and **Ctrl-A**, and I felt like a keyboard ninja. 😄

It was a long time ago and I did add some more hot keys in my arsenal, but even when I started coding, I didn’t really _live_ on the keyboard. I still don’t, fully.

But my wishes were heard. I was reading a paragraph in a book "Data analyst tools: command line", and the author began the paragraph with:

> "Okay, let's do it just using the keyboard."

And I thought: _Yeah! Let's do it!_

### Why the keyboard matters

The command line runs in a **REPL (Read-Eval-Print Loop)**:

1. The program displays an input prompt (for example, `C:\Users\alinaaleks>`), indicating it’s ready to execute commands.
2. You type a command with any parameters and hit **Enter**.
3. The program runs the command, shows the results, and displays a new prompt.

If you’re doing something **hundreds of times**, repeating actions across multiple computers, or automating tasks every few minutes — it’s a _terrible waste_ of human time to rely on a mouse.

### Scripts: your best friend

Instead of clicking around, you can write a series of commands in a **text file** — a script — and let the computer repeat them.

Your scripts can control:

- Programs and commands installed on your system
- Files and folders
- Settings
- Browser, word processor, spreadsheets
- Databases
- …pretty much anything you can type a command for

Writing commands in text is **clear, precise, and repeatable**.

---

### Handy Windows shortcuts

- **Win + type app name → Enter** — open any app
- **Alt + Tab** — switch between windows quickly
- **Win + E** — open File Explorer
- **Ctrl + L** — in File Explorer, focus the path bar
- **Ctrl + E** — in File Explorer, search

### Git Bash essentials

- **Tab** — autocomplete files, folders, and commands
- **↑ / ↓ arrows** — scroll through previous commands
- **Ctrl + R** — search command history (my favorite!)
- **Ctrl + A / Ctrl + E** — jump to the start/end of the line
- **Ctrl + L** — clear screen
- **clear** — also clears the screen
- **Ctrl + W** — delete the previous word
- **Alt + D** — delete the next word
- **Ctrl + U** — clear the entire line
- **Ctrl + C** — cancel a running command

### Pro tip: Aliases

Ohh, I love this one. Creating **shortcuts for most-used Git commands:**

```bash
git config --global alias.s "status -sb"
git config --global alias.a "add ."
git config --global alias.c "commit -m"
git config --global alias.p "push"
git config --global alias.lg "log --oneline --graph --decorate"
```

<p></p>

**See all your aliases:** `git config --global --get-regexp alias`.

So now, I just type `git s`, `git c` (only adding a message after), `git lg` and how great it feels.

![Git Bash examples](/assets/posts/hacker-skills/git-bash-example.png){: .center width="600" height="auto"}

---

Project on this topic: [Command Bot in Telegram](/project/command-bot)

---
