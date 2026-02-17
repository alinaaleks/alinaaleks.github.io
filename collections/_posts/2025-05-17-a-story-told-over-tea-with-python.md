---
date: 2025-05-17 22:22:00 +0300
title: "A Story Told Over Tea (with Python)"
description: "A tale of app migrations, meaning, and automations."
tags: [Python, lyrical]
image: "/images/posts/post-8/laptop-is-my-cup-of-tea.jpg"
---

Today I’m wrapped in my cozy robe, sipping hibiscus tea, and about to dive into the past.  
Fret not — it’s related to data.

Lately, I often wonder how I, so obsessed with gathering and organizing information, hadn’t discovered Python earlier. **I did _so much_ manual work!**
But maybe I had to go through all those tedious tasks to now understand how to process things better. Still, I’m surprised by how long I remained in the dark.

## The Urge to Organize

I’ve been in it for many, many years.  
When I was around 18, I found myself surrounded by diaries, notes scribbled on scraps of paper, bookmarks, self-sent emails, Word docs, blog posts, recipes, wishes, plans…  
**I felt this need to _make sense_ of it all.** I wanted it to serve me—to be organized in a way that was

- accessible,
- visually structured,
- logical,
- and clean.

I never understood the idea of collecting information just for collecting information. To let it sit somewhere. 🪑
**Why save _anything_ if it’s going to be lost in the clutter?**
I can _feel_ the heaviness of disorganized information.

## Copy, Paste, Repeat. The App-Hopper

I tried countless tools: note-taking apps, calendars, databases, paper journals, diary platforms.  
I’ve migrated from one to another so many times, copy-pasting for hours, sometimes weeks. Then I’d find something slightly more efficient—and migrate again. Like a migratory bird with a thing for productivity apps. 🕊️

The longest path I walked was with Notion. About five years.  
During that time, I also collected observations on what I’d improve. Now I can only access it through a VPN, and I’m tired of that instability.

And I guess I just cannot stick to one solution forever. I want improvements. Sense of growth.

<p class="notation">I’m not saying the apps are bad because I moved on from them. I truly appreciate the time I spent using them.</p>

## Airtable, We Barely Knew Ye

When VPN-issues with Notion became ever more pressing, I started moving to Airtable, and have been using it for barely two months before I hit the upload limit. That, paired with a few other observations, told me I needed a new solution. Migration, ladies and gentlemen! 🕊️

Right now, I’m exploring Obsidian as a new promising path. I’m discovering that it requires a bit of technical touch, and I’m thrilled by it.

<p class="notation">Yet I feel that, eventually, I’ll be able to create a tool of my own—a personal app shaped by my needs. Something I’ll refine as I grow. Something I’ll be in full control of.</p>

## Python, Thy Name is Delicious!

I think **I needed to write all this to honor the _long-long road_ I’ve walked in order to appreciate the _new road_ filled with more efficiency.** New era of migration! Yesterday, I was _blown away_ by the efficiency of a simple automation.

I worked with my recipe book. [1 - link below, my recipe book template]

And with just a few lines of Python, I turned my CSV file into `.md` recipe cards for Obsidian. What previously was **a row in airtable became an `.md` in Obsidian**, with unified lines of code for template record.

My bigger concern, though, was transferring images. In the past, I downloaded them manually and would upload them again to each record.  
It used to take _days_.

But this time?

Using the Airtable API, a personal token, and just the basic structure of my table — **I downloaded _all_ the images with Python in under five minutes.**
Yes, I also had to understand the code, test it, tweak it — but the whole process took less than two hours.

Watching those lines — `Downloading image.jpg` — appear, one by one...

![Printed message in Jupyter Notebook that Images were Downloaded](/images/posts/post-8/jupyter-imgs-downloaded.png){: .center width="600" height="auto"}

...was such a pleasure to experience!

<p class="notation">When you know what it is like to do it manually, you can <i>truly</i> appreciate the beauty of it.</p>

## The Next Cup of Tea

I think of refining this script and mapping it out as a mini-project.
I imagine I might be coming back to it more than once. [2]

<div class="end-comment">
  <p class="remove-space-below"><a href="/project/recipe-book-template" target="_blank">[1] Recipe Book Template</a></p>
  <p class="remove-space-below"><a href="/project/image-downloader" target="_blank">[2] Image Downloader with Python</a></p>
</div>

---

Thank you for a warm chat.

![Thank you note in a cup](/images/posts/post-8/thank-you-note.jpg){: .center width="500" height="auto"}

---
