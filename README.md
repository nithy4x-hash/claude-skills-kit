# Claude Skills Kit

165 ready-to-use skills for Claude Code: websites and design, video, Instagram, marketing, sales and writing.
Install once and Claude picks the right skill on its own when a task matches, or you can call one by name with `/skill-name`.

## Install (about 1 minute)

You need [Claude Code](https://claude.com/claude-code) installed (Pro plan or higher) and [Git](https://git-scm.com/downloads).

**Windows** (PowerShell):
```powershell
git clone https://github.com/nithy4x-hash/claude-skills-kit.git
cd claude-skills-kit
powershell -ExecutionPolicy Bypass -File install.ps1
```

**Mac or Linux** (Terminal):
```bash
git clone https://github.com/nithy4x-hash/claude-skills-kit.git
cd claude-skills-kit
bash install.sh
```

Then **restart Claude Code**. Type `/` in a chat to see the skills.

The installer copies each skill into `~/.claude/skills/` and never overwrites a skill you already have with the same name
(it tells you which ones it skipped). To update later: `git pull`, then run the installer again with `-Force` (Windows) or `--force` (Mac/Linux).

### Tips
- Don't worry about using them all. Claude only loads a skill when your request matches it.
- To use one directly, name it: "use the humanizer skill on this", or type `/ig-reel`.
- A few skills run small Python scripts (ui-ux-pro-max, color-grade, the ig-* scorers). If one asks for Python packages,
  let Claude install them, e.g. `pip install numpy opencv-python-headless` for color-grade. Video skills need `ffmpeg`.
- Some skills can call paid services only if you add your own API key (e.g. the `design` logo generator, `metaads`). Nothing is paid by default.

## What's inside

### Websites & design (29)

| Skill | What it does |
|---|---|
| `algorithmic-art` | Creating algorithmic art using p5.js with seeded randomness and interactive parameter exploration. |
| `awwwards` | Design and build websites to Awwwards jury standard (Site of the Day / Developer Award / Mobile Excellence). |
| `banner-design` | Design banners for social media, ads, website heroes, creative assets, and print. |
| `brand` | Brand voice, visual identity, messaging frameworks, asset management, brand consistency. |
| `brandkit` | Premium brand-kit image generation skill for creating high-end brand-guidelines boards, logo systems, identity decks, and visual-world presentations. |
| `canvas-design` | Create beautiful visual art in .png and .pdf documents using design philosophy. |
| `d3-viz` | Creating interactive data visualisations using d3.js. |
| `design` | Comprehensive design skill: brand identity, design tokens, UI styling, logo generation (55 styles, Gemini, Atlas Cloud, MuAPI, or UberLLM AI), corpora… |
| `design-system` | Token architecture, component specifications, and slide generation. |
| `design-taste-frontend` | Anti-slop frontend skill for landing pages, portfolios, and redesigns. |
| `design-taste-frontend-v1` | The original v1 taste-skill, preserved for projects depending on its exact behavior. |
| `frontend-design` | Guidance for distinctive, intentional visual design when building new UI or reshaping an existing one. |
| `full-output-enforcement` | Overrides default LLM truncation behavior. |
| `gpt-taste` | Elite UX/UI & Advanced GSAP Motion Engineer. |
| `high-end-visual-design` | Teaches the AI to design like a high-end agency. |
| `image-to-code` | Elite website image-to-code skill for Codex. |
| `imagegen-frontend-mobile` | Elite mobile app image-generation skill for creating premium, app-native screen concepts and flows. |
| `imagegen-frontend-web` | Elite frontend image-direction skill for generating premium, conversion-aware website design references. |
| `industrial-brutalist-ui` | Raw mechanical interfaces fusing Swiss typographic print with military terminal aesthetics. |
| `minimalist-ui` | Clean editorial-style interfaces. |
| `playwright-cli` | Automate browser interactions, test web pages and work with Playwright tests. |
| `redesign-existing-projects` | Upgrades existing websites and apps to premium quality. |
| `slides` | Create strategic HTML presentations with Chart.js, design tokens, responsive layouts, copywriting formulas, and contextual slide strategies. |
| `stitch-design-taste` | Semantic Design System Skill for Google Stitch. |
| `theme-factory` | Toolkit for styling artifacts with a theme. |
| `ui-styling` | Create beautiful, accessible user interfaces with shadcn/ui components (built on Radix UI + Tailwind), Tailwind CSS utility-first styling, and canvas-… |
| `ui-ux-pro-max` | UI/UX design intelligence for web, mobile, and desktop. |
| `web-artifacts-builder` | Suite of tools for creating elaborate, multi-component claude.ai HTML artifacts using modern frontend web technologies (React, Tailwind CSS, shadcn/ui… |
| `webapp-testing` | Toolkit for interacting with and testing local web applications using Playwright. |

### Video & media (22)

| Skill | What it does |
|---|---|
| `capcut-edit` | Edit CapCut / JianYing video projects — read and write subtitles, timing, speed, volume, templates, animations (fade/ken-burns), and cut long-form to … |
| `color-grade` | Expert color grading of images and videos from reference images or a named movie look. |
| `figma` | Bring Figma into a HyperFrames video - rendered assets, brand tokens, components, storyboard frames as reconstructed motion (frames read as states, no… |
| `hyperframes` | Read first to make, edit, animate or render any video with HyperFrames (HTML rendered to video), including launch films, explainers, music videos, cha… |
| `hyperframes-cli` | HyperFrames CLI - scaffold, check frames, edit timelines, preview, render, share and project history; read JSON and recover from failures. |
| `hyperframes-registry` | About 450 ready-made HyperFrames blocks and components installed as editable source - transitions, overlays, titles, kinetic type, captions, charts, m… |
| `media-use` | Get or make any media for a HyperFrames video - music, sound effects, images, icons, logos, voiceover, avatar and generated video, transcripts, cutout… |
| `remotion-best-practices` | Router for all Remotion skills |
| `remotion-captions` | Transcribing, displaying and animating captions |
| `remotion-create` | Create a new Remotion video |
| `remotion-docs` | Search Remotion documentation |
| `remotion-interactivity` | Structure Remotion markup for interactivity |
| `remotion-maps` | Remotion Map animation knowledge |
| `remotion-markup` | Content, animation and effects best practices |
| `remotion-multimedia` | Interacting with Mediabunny |
| `remotion-render` | Export a Remotion video |
| `remotion-saas` | Build an app with Remotion |
| `remotion-studio` | Preview a Remotion video |
| `remotion-to-hyperframes` | Bring existing video code or footage into HyperFrames and verify it frame by frame against the original - Remotion first, also Motion Canvas, Lottie, … |
| `remotion-upgrade` | Upgrade Remotion, and related packages |
| `slack-gif-creator` | Knowledge and utilities for creating animated GIFs optimized for Slack. |
| `slideshow` | Build a HyperFrames slideshow to present live - slides, fragment reveals, branching hotspots and presenter mode with speaker notes, served by `hyperfr… |

### Instagram (13)

| Skill | What it does |
|---|---|
| `ig-audit` | ig-audit |
| `ig-caption` | Write the Instagram caption - the line that survives the "... |
| `ig-carousel` | ig-carousel |
| `ig-comment` | ig-comment |
| `ig-dm` | ig-dm |
| `ig-human` | ig-human |
| `ig-plan` | ig-plan |
| `ig-profile` | ig-profile |
| `ig-reel` | Write an Instagram Reel from a raw idea - hook options off 26 formulas, the spoken script, the on-screen text, and a timed beat sheet - in the user's … |
| `ig-reply` | ig-reply |
| `ig-repurpose` | ig-repurpose |
| `ig-story` | ig-story |
| `ig-viral` | Go and find the reels that are actually working right now in the user's niche, rank them by how far each beat its own account, name the hook formula e… |

### Marketing (53)

| Skill | What it does |
|---|---|
| `ab-testing` | When the user wants to plan, run, or read A/B tests, or asks a judgement call on one: is the result real, can we stop, which version won, is this wort… |
| `ad-creative` | When the user wants to write or judge ad creative, or asks which ad, hook, or angle to run or kill: headlines, primary text, and variations for Google… |
| `ads` | When the user wants to plan, run, or fix paid ads on Google, Meta, and LinkedIn, or asks a judgement call on them: are ads worth it, which channel or … |
| `ai-seo` | When the user wants to get cited and recommended in AI answers (ChatGPT, Perplexity, AI Overviews), or asks why AI cites a competitor, which content g… |
| `analytics` | When the user wants to set up or audit analytics, or asks whether a metric or number is calculated right, what to track, or how to name events: tracki… |
| `aso` | When the user wants to audit or optimize an App Store or Google Play listing, or asks which title, keywords, or screenshots to pick or why downloads a… |
| `attribution` | When the user wants to work out which marketing drives revenue, or asks whether a channel is really working, which numbers to trust, or how to credit … |
| `churn-prevention` | When the user wants to reduce churn, or asks why customers cancel, whether to offer a discount or pause: cancellation flows, exit surveys, save offers… |
| `co-marketing` | When the user wants co-marketing partners or joint campaigns, or asks whether a partner fits, a size mismatch matters, or how to split work and leads:… |
| `cold-email` | When the user wants to write or run B2B cold outbound, or asks whether an opener, reason to reach out, or email works or why nobody replies: cold emai… |
| `community-marketing` | When the user wants to build or grow an online community, or asks whether a community is worth it, where to host it, or why members stay quiet: Discor… |
| `competitor-profiling` | When the user wants to research competitors into dated profiles, or asks what a rival charges, claims, or is doing, or whether a conclusion about them… |
| `competitors` | When the user wants to create or audit comparison and alternative pages ('X vs Y', 'X alternative', 'best X alternatives'), or asks what a public page… |
| `content-strategy` | When the user wants to plan content, or asks which topic or piece to prioritize, what to write about, or why posts bring no customers: topic clusters,… |
| `conversion-tracking` | When the user wants to set up, audit, or fix conversion tracking to Google Ads, Meta, GA4, LinkedIn, and TikTok, or asks why conversions are missing o… |
| `copy-editing` | When the user wants to edit, tighten, proofread, or refresh existing copy, or asks whether to keep, cut, or change a line in it, without rewriting fro… |
| `cro` | When the user wants more conversions from a page or form, or asks why a page isn't converting, what to change first, or whether to add or remove a fie… |
| `customer-research` | When the user wants to run or synthesize customer research, or asks what customer quotes, reviews, or feedback really mean, what is safe to conclude, … |
| `directory-submissions` | When the user wants to list a product in startup, SaaS, AI, MCP, and review directories, or asks which directories are worth it or whether listings ar… |
| `emails` | When the user wants to create or improve automated email sequences, or asks what to send, when, or whether an email or flow is working: welcome, onboa… |
| `events` | When the user wants to plan, run, sponsor, or speak at events, or asks whether an event or booth is worth the money: webinars, conferences, booths, me… |
| `free-tools` | When the user wants to plan or build a free tool as marketing, or asks whether a tool idea is worth building or which one to pick: calculators, grader… |
| `image` | When the user wants to create, generate, edit, or optimize marketing images, or asks which approach to take (generate, design, or photograph): blog he… |
| `influencer-marketing` | When the user wants creator, influencer, or ambassador partnerships, or asks which creators fit, what to pay, which rights to buy, or whether a sponso… |
| `launch` | When the user wants to plan a product or feature launch, or asks whether it's ready, when to announce, or how to get noticed: Product Hunt, beta and e… |
| `lead-magnets` | When the user wants to plan or improve a lead magnet, or asks what to give away for emails or how much to ask in return (gating, form fields): checkli… |
| `link-building` | When the user wants backlinks and mentions that lift rankings and AI citations, or asks how to get sites to link, whether a link tactic is safe, or wh… |
| `marketing-council` | When the user wants several expert takes on a marketing decision, or asks what a famous marketer would say about it: a simulated board (Seth Godin, Da… |
| `marketing-ideas` | When the user wants marketing ideas or growth tactics for a software product, or asks what to try to get attention or the next customers with little t… |
| `marketing-loops` | When the user wants a recurring marketing job an AI agent runs on a cadence or trigger, or asks what a weekly or daily automated check should do, reme… |
| `marketing-plan` | When the user wants a full marketing or go-to-market plan for a client, an advised company, or their own product, or asks how to sequence or prioritiz… |
| `marketing-psychology` | When the user wants to apply psychology to marketing, or asks why buyers behave or value things as they do, or whether a persuasion tactic is honest: … |
| `mkt-copywriting` | When the user wants to write or rewrite page copy (homepage, landing, pricing, feature), or asks which headline, promise, or message to lead with. |
| `offers` | When the user wants to design or improve the offer itself, or asks why it isn't selling or how to add urgency honestly: value stacking, bonuses, guara… |
| `onboarding` | When the user wants better onboarding and activation, or asks why new users don't stick or what the first session should do: first-run experience, aha… |
| `paywalls` | When the user wants to create or improve in-app paywalls and upgrade moments, or asks when or how hard to ask free users to pay (after they've seen va… |
| `popups` | When the user wants to create or improve popups, modals, slide-ins, sticky bars, and banners, or asks whether one will help or annoy and when to show … |
| `pricing` | When the user wants to set pricing and packaging, or asks what to charge, whether to raise prices, or how to move existing customers: tiers, value met… |
| `product-marketing` | When the user wants to create or update the product marketing context doc (.agents/product-marketing.md), or asks what belongs in it or whether positi… |
| `programmatic-seo` | When the user wants SEO pages at scale from templates and data, or asks whether a page set will rank or look thin: location, integration, comparison, … |
| `prospecting` | When the user wants to find and qualify prospects for outbound, or asks who to target first, which signal to prioritize, or where to spot buyers with … |
| `public-relations` | When the user wants press and media coverage, or asks what to say to a reporter, whether a story is newsworthy, or how to handle a crisis: pitches, pr… |
| `referrals` | When the user wants referral and affiliate programs or word of mouth, or asks what to reward, how much to pay, or which loop to start with: refer-a-fr… |
| `reverse-engineer-marketing` | When the user wants to know how another company grew and what to copy, or asks what a competitor did and when: a dated log of their moves against thei… |
| `revops` | When the user wants to design revenue operations, or asks when a lead is ready for sales or why sales and marketing disagree on lead quality: lifecycl… |
| `sales-enablement` | When the user wants sales collateral, or asks what to give a champion or rep, or how to answer an objection or make the case: decks, one-pagers, objec… |
| `schema` | When the user wants to add, fix, or validate schema markup (JSON-LD), or asks which type fits a page or whether some markup is allowed: product, revie… |
| `seo-audit` | When the user wants to audit or diagnose SEO, or asks why traffic dropped, a page won't rank, or whether a setup like canonicals, hreflang, or redirec… |
| `signup` | When the user wants better signup, registration, and trial start flows, or asks which fields or steps to cut or whether to require a card: SSO and dro… |
| `site-architecture` | When the user wants to plan or restructure a website, or asks which pages they need or where something belongs: hierarchy, navigation, URL structure, … |
| `sms` | When the user wants SMS, MMS, or WhatsApp marketing, or asks whether texting is worth it or a message is allowed: abandoned cart, win-back, and promo … |
| `social` | When the user wants organic social content for LinkedIn, X, Instagram, TikTok, or Facebook, or asks what to post, which format to favor, or from which… |
| `video` | When the user wants to create video with AI tools or code, or asks which approach to use (screen recording, AI avatar, generated, or templated) or how… |

### Business: Entrepreneur (25)

| Skill | What it does |
|---|---|
| `automation-workflows` | Automation Workflows |
| `cold-outreach` | Cold Outreach |
| `competitive-analysis` | Competitive Analysis |
| `copywriting` | Copywriting |
| `decision-frameworks` | Decision Frameworks |
| `delegation-framework` | Delegation Framework |
| `email-campaigns` | Email Campaigns |
| `financial-modeling` | Financial Modeling |
| `founder-productivity` | Founder Productivity |
| `fundraising` | Fundraising |
| `hiring-playbook` | Hiring Playbook |
| `landing-pages` | Landing Pages |
| `market-research` | Market Research |
| `metaads` | From your project root (where .env lives): |
| `objection-handling` | Objection Handling |
| `offer-creation` | Offer Creation |
| `paid-ads` | Paid Ads |
| `pitch-deck` | Pitch Deck |
| `pricing-strategy` | Pricing Strategy |
| `product-market-fit` | Product-Market Fit |
| `seo-content` | SEO Content |
| `social-media` | Social Media |
| `sop-builder` | SOP Builder |
| `team-building` | Team Building |
| `unit-economics` | Unit Economics |

### Business: AI Sales Team (14)

| Skill | What it does |
|---|---|
| `sales` | AI Sales Team — Main Orchestrator |
| `sales-competitors` | Sales Competitive Intelligence |
| `sales-contacts` | Decision Maker Intelligence & Contact Strategy |
| `sales-followup` | Follow-Up Sequence Generator |
| `sales-icp` | Ideal Customer Profile Builder |
| `sales-objections` | Objection Handling Playbook |
| `sales-outreach` | Cold Outreach Sequence Generator |
| `sales-prep` | Meeting Preparation Brief |
| `sales-proposal` | Sales Proposal Generator |
| `sales-prospect` | Full Prospect Analysis Orchestrator |
| `sales-qualify` | Lead Qualification Engine (BANT + MEDDIC) |
| `sales-report` | Sales Pipeline Report Generator |
| `sales-report-pdf` | Professional Sales Report PDF Generator |
| `sales-research` | Company Research & Firmographic Analysis |

### Writing (5)

| Skill | What it does |
|---|---|
| `doc-coauthoring` | Guide users through a structured workflow for co-authoring documentation. |
| `frontend-slides` | Create stunning, animation-rich HTML presentations from scratch or by converting PowerPoint files. |
| `humanizer` | Rewrite AI-sounding text so it reads like the writer without changing what it says. |
| `internal-comms` | A set of resources to help me write all kinds of internal communications, using the formats that my company likes to use. |
| `stop-slop` | Remove AI writing patterns from prose. |

### Utilities (4)

| Skill | What it does |
|---|---|
| `find-skill` | Finds and installs Claude Code Skills for your project. |
| `find-skills` | Helps you discover and install agent skills from skills.sh when you ask "is there a skill for X" (by Vercel). |
| `mcp-builder` | Guide for creating high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services through well-designed tools. |
| `owasp-security` | Reviews code for security vulnerabilities and guides secure implementation using OWASP Top 10:2025, ASVS 5.0, the OWASP Top 10 for LLM Applications (2… |

Plus one command: `/web-interface-guidelines` (checks a web page against Vercel's interface guidelines).

## Credits

These skills were written by other people. See [CREDITS.md](CREDITS.md) for every source and licence.
This repository is private and shared for personal use; please don't republish it.
