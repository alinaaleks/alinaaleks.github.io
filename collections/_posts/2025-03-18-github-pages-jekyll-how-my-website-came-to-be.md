---
date: 2025-03-18 11:19:00 +0300
title: "GitHub Pages & Jekyll: How My Website Came to Be"
description: "This combo is 'Best for You', ChatGPT said. I decided to try &mdash; and now you're reading these words on that very setup."
tags: [website]
image: "/images/posts/post-1/website-plan.jpg"
---

I just want to perpetuate this. It feels so great to have your own website. We (can’t say 'I', because ChatGPT is my mighty companion) deployed it just now and I am very happy.

**It took 2 days from idea to life.** Given that 48 hours ago I didn’t even know the word jekyll and now <code>bundle exec jekyll serve</code> makes my heart pump 😄, it is truly something.

So,

## My Request was:

**Personal website**, with:

- Having control over my content
- Ability to add blog posts, projects (and maybe have a sidebar later)
- Free/cheap
- Easy to deploy
- Achievable (it is subjective in this case, so I can't exactly measure it)

## Solution chosen:

<strong>GitHub Pages + Jekyll\*</strong>

- **Free** (just pay for a domain if you want)
- **Customizable** – themes, sidebar, projects, and blog all in one
- **Tech-friendly but manageable** – uses Markdown + some config files
- **Achievable** - there's nothing we can't do with ChatGPT!\*\*

<p class="notation">*Jekyll is a static site generator which works directly with GitHub Pages.</p>
<p class="notation">**Plus, I think understanding what html/css/js/git are, not being afraid of the command line, and being willing to do a little digging is enough.</p>

## How it works

- GitHub Pages hosts site for free
- Jekyll takes Markdown files (.md), converts them into HTML, and organizes into a structured website (like now - this post is written in .md)
- Website updates automatically when changes are pushed to GitHub repo (otherwise, it remains unchanged - that's what a static website means)

## Steps taken:

**STEP 1.** Clean GitHub Repository (I already had one for that purpose); Check GitHub Pages are enabled

**STEP 2.** Install Ruby (usual download + installation) => Install Bundler + Jekyll (via terminal: `gem install jekyll bundler`)

**STEP 3.** Create basic Jekyll Site (`jekyll new . --force`). **OR** Find template online. I chose <a href="https://github.com/CloudCannon/vonge-jekyll-bookshop-template" target="_blank">Vonge theme</a>. It was created for hosting at CloudCannon, but adaptable for GitHub pages as well.

- Download ZIP of the theme
- Add to my repo
- Clean it up (delete unnecessary files like cloudcannon-related, README, etc).
<p class="notation">I only know a bit of front-end development, so I was careful with this step and tried to keep the initial structure intact (also in case I need some of the features later I just commented them out).</p>

**STEP 4.** Update configuration files (.yml, Gemfile)

**STEP 5.** Test website locally.

<p class="remove-space-below">Here goes that sweet <code>bundle exec jekyll serve</code>😊</p>
<p class="notation">Keep it running for the next steps.</p>

**STEP 6.** Personalization - hide unnecessary components (like testimonials, newsletter), update images, logo, social links, descriptions.

**STEP 7.** Create custom 404 Page.

**STEP 8.** Don't forget to commit your changes to repo in smaller chunks. I forgot.

**STEP 9.** Deploy to GitHub Pages. I.e. `git push origin main`, and

<p>this is where the main <i>“Oh, no!”</i> moment took place.</p>

![Website is not working](/images/posts/post-1/website-is-not-working.png){: .center width="568" height=auto}

![Deployment failure](/images/posts/post-1/deployment-failure.png){: .center width="1040" height=auto}

<p class="notation">wah-wah-wah-waaah.</p>
And the treacherous _“what if it won’t work EVER?!”_ crept in...

**but it was resolved!**

## What happenned?

It ran perfectly on my local machine, but failed during deployment on GitHub Pages.
**Gemfile error.**

```
The github-pages gem can't satisfy your Gemfile's dependencies. If you want to use a different Jekyll version or need additional dependencies, consider building Jekyll site with GitHub Actions
```

<p></p>
## Solution:

Change in GitHub repo settings from "Deploy from a branch" (default) to **"Deploy from GitHub Actions"**. It allows to specify which versions of Jekyll or other gems to use, as well as customize the build process.

## Steps:

**1.** Go to Settings => Pages => Under Source, select GitHub Actions.
**2.** Follow the prompt to create the `jekyll.yml` file. => This file will open upon creation.

   <p class="notation">This YAML file will run your Jekyll build process each time you push changes to your repository, making it much more flexible for handling dependencies and custom configurations.</p>
<ol start="3">
  <li>"Configure <code>jekyll.yml</code> file (ChatGPT filled it in for me, but if you're interested <a href="https://github.com/alinaaleks/alinaaleks.github.io/blob/main/.github/workflows/jekyll.yml" target="_blank"></a>check out in my repo) => Commit changes</li>
  <li>Go to Actions => Choose "Deploy Jekyll site to Pages"</li>
</ol>

![We are live, baby!](/images/posts/post-1/we-are-live-baby.png){: .center width="259" height=auto}

Who's a website-owner now? 😎

**STEP 10.** Create my happy post.

---

<p class="notation-l">All in all, it turned out to be easier than I thought. Totally doable.</p>

---

## Some questions along the way:

**Do I need to mention my theme name in `_config.yml`?**
_If you are using your own theme (like Vonge), you don’t need to specify a theme name in `_config.yml.` Instead, make sure the theme files are in the right place in your repo, and Jekyll will use them._

**What is _this_ bookshop anyway?**
_Bookshop is a component-driven design system for Jekyll and other static site generators. It helps developers manage and reuse UI components more easily._

**Why code treated as YAML in my `index.html`?**
_Because your `index.html` file contains front matter, which is YAML.
In Jekyll, front matter refers to the section at the top of each page or post file, where you define metadata like the title, layout, and other variables. This section is enclosed between --- lines and is typically written in YAML format._

_When you comment out parts of it incorrectly, it can break the YAML parsing.
The rest of the file will be parsed as HTML._

**Can extensions of files be case-sensitive? Request url contains `page-1.**jpg**`and my file is`page-1.**JPG**`**
_Yes, it can absolutely be case-sensitive! On GitHub Pages, URLs are case-sensitive, and page-1.jpg and page-1.JPG are considered two different files._

**What can be more satisfying than the moment when code finally works?!**
_There's truly nothing, darling._

---
