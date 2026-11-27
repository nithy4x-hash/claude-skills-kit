# Website Playbook: how I want websites built

> **For the person using this:** put this file in your project folder (or paste it into your project's `CLAUDE.md`) and tell Claude:
> *"Read WEBSITE-PLAYBOOK.md and follow it for every website we build."*
> Everything below is written to Claude. It comes from many rounds of real feedback on real client sites: what got approved, what got rejected and why.

---

## 0. Who you are working for, and the one rule above all

You are building websites for a person with a strong, specific eye. They judge a site in the first three seconds and they can tell instantly when something is generic, template-made or "AI slop". Your job is not to produce *a* website. It is to produce *their client's* website, so good that the client says yes on sight.

**The rule above all:** every site must feel made for this one brand, by a designer who studied it. If any part could be dropped onto another company's site unchanged, it is not done.

---

## 1. The process, start to finish

Follow these steps in order. Don't skip research to get to code.

### Step 1: Research the brand before designing anything
- Study the client's real presence first: Instagram (bio, captions, highlights, reels, photos), their existing website if any, Google reviews, their Typeform or booking pages.
- Collect **real facts only**: their services, venues, dates, client names they already publish, prices they state, their own phrases. Write the site **in their words**. Captions and reviews are gold.
- Download their **real logo** (an Instagram profile picture works if nothing else exists) and their real photos at the highest resolution available.
- Note their existing visual identity: colours, fonts and feel (a Typeform, an Instagram grid, printed material). **The site must match how the brand already looks.**
- Anything you could not verify must be flagged as an assumption, never presented as fact. Never invent testimonials, numbers, clients or awards.

### Step 2: Write a one-line design read
Before code, state the page kind, the audience, the vibe and the one signature idea, e.g. *"Premium coach site for busy women, in the brand's black-and-pink Typeform look; signature: a loader where the name assembles and flies into the header."*

### Step 3: Build, deploy and show
- Build as a fast static site (HTML/CSS/JS; GSAP and Lenis when motion is needed; self-hosted fonts; WebP images with `srcset`).
- Deploy to Vercel so it can be opened on a phone. Concept and pitch sites get `noindex` (a `vercel.json` header plus `robots.txt`) until the client approves.
- **Big changes go to a separate preview link first**, not the live link, and move to the main link only when approved.
- Always keep a backup of the previous version before a big change so it can be restored.

### Step 4: Check everything yourself before saying "done"
See Section 9. Never hand over something you haven't opened at phone and desktop size.

### Step 5: Give choices the right way
When there is a real choice (photos, colour themes, crops), build a **visual picker page** with numbered options and let them pick. Don't describe options in text.

### If there is no existing brand (a new or concept brand)
Define it before designing: name, a wordmark logo, 4–6 named colours drawn from the product's own world, and two fonts. Use a mood board (e.g. Pinterest) **only as reference**; never put other people's photos on the site. Generate original photos instead (Flow, see the video guides), and say clearly in the footer that the brand is a concept.

---

## 1b. Non-negotiables on EVERY website

These apply to every site you build, on top of everything else in this file.

1. **A personalised loader.** Every site opens with a short loader made from **that brand's own logo or wordmark**. Examples: the real logo assembled from its pieces, or a wordmark catching a gold shine. It then moves into its place in the header as the page appears. It plays once per visit, any tap, key or scroll skips it, `?intro` replays it, and it's off when the visitor prefers reduced motion. Never a generic spinner or progress bar.

2. **Luxury smooth scroll.** Every site gets the smooth, weighted scroll that luxury sites have (Lenis, `lerp` about 0.09; anchor links glide to their section).
   - It must **never trap** the page: wheel, trackpad, touch, keyboard (arrows, Page Up/Down, Space, Home, End) and the scrollbar all keep working.
   - It's off with reduced motion, and it pauses while a drawer or lightbox is open.
   - The only exception is click-through pitch decks, which get no scroll effects at all.

3. **Interactive features: at least 2, aim for 4.** Every site needs real interactions that a visitor uses, not just animations they watch. Pick ones that fit the business, for example:
   - a hero that reacts to the cursor or finger (e.g. light that follows you across gold jewellery)
   - a working bag or wishlist drawer
   - a builder that writes a pre-filled WhatsApp message
   - a tabbed "how to wear it" or "choose your plan" switcher
   - a calculator or finder (ring size, price, quantity)
   - a review slider
   - video testimonials that preview on hover and play in a lightbox
   - a goal finder or quiz

   Each must work with mouse, touch and keyboard.

4. **Products are shown in screen-sized sets.** On any site that displays products, **at least half of them** (ideally all) appear in **screens that are exactly the height of the window** (100svh).
   - Each screen holds a whole number of complete product cards, and no row is cut off and continued on the next screen. You choose how many per screen: typically **3 per screen on desktop, 2 on phone**.
   - When scrolling stops near the top of a product screen, it **settles gently** onto that screen. It never fights the user and never traps them.
   - On very short windows (e.g. a phone held sideways), fall back to normal flowing cards.

5. **Every commercial website has a testimonial section.**
   - **Real reviews only:** video testimonials from the client's Instagram (transcribed word for word) are best, then Google or written reviews with names and context.
   - **Never invent reviews and present them as real.**
   - For a fictional or concept brand, the section can be built with sample reviews, but it must say clearly on the page that they are samples.

6. **No gradient colour over photos.** Never put a gradient, colour fade, scrim or colour wash over a background photo; it looks cheap. Photos stay clean and uncoloured. Text sits beside the photo, on solid colour, never on a gradient over it.

---

## 2. What they love

- **Cinematic first impression.** A branded loader or intro where the **real logo** animates (pieces assemble, letters drop in, then the mark flies into its spot in the header as the page reveals). Once per visit; skippable with a tap; replayable with `?intro`.
- **One signature moment**, not twenty effects. Examples that landed: a full-screen method section that glides one slide per scroll gesture; a party builder that writes a ready-to-send WhatsApp message; a logo intro built from the real logo.
- **Real photography, HD.** Their own photos, upscaled (AI-upscaled if needed), crisp on phones. Real people from the brand.
- **Real proof.** Actual reviews and testimonials, ideally **video testimonials from their Instagram**, with quotes transcribed word for word from what the person says on camera.
- **Bold, confident colour** taken from the brand. For bright brands (kids, events, fitness), use the logo's colours **at full strength** as section backgrounds, with sections joined by a playful edge (e.g. scalloped waves) when it suits the brand.
- **Editorial, grown-up layouts:** asymmetry, big confident type, generous space, one featured item plus smaller supporting items.
- **Mobile that is designed, not shrunk.** On phones: swipe rows, cards that preview on their own when in view, progress indicators and small rewards as you scroll, so it's never boring.
- **Speed and polish:** instant loading, nothing jumping around, everything aligned.

## 3. What they hate: never do these

**"AI slop" signals (instant rejection):**
- Generic template layouts: centred hero with three equal cards, a "features" grid of icon + title + text.
- Rainbow everything, equal-weight colour cards, icon chips, pill tags everywhere, emoji, balloons and confetti as decoration.
- Headlines in ALL CAPS with the last word in pink italics, eyebrow labels on every section, marquee tickers, magnetic buttons, loading bars, invented labels.
- Purple-blue AI gradients, glassmorphism on everything, glowing buttons.
- Typography that looks default or "AI". Pick type with intent.

**Content and imagery:**
- **Never use empty image placeholders** or "photo coming soon" panels. That reads as unfinished and unprofessional.
- **Never put text over photos.**
- **Never put a gradient or colour fade over a photo** (dark fades at the edges, colour washes, scrims). It makes the site look cheap.
- **Never repeat the same photo** anywhere on a page. When new photos are picked, they replace the similar-looking old ones.
- No blurry or low-resolution images. Upscale everything.
- No stock photos and no lorem ipsum.

**Colour:**
- **Plain white background with plain black text is boring.** Rejected.
- **Washed-out pastel tints are "very dull".** Rejected. Use real brand colour.

**Motion:**
- **No confetti, ever, anywhere** (not in intros, not on buttons).
- Never trap the scroll. Every pinned or "one slide per scroll" section must let the user scroll past normally, with keyboard, trackpad and touch all working. A section you can't get out of is a critical bug.
- For click-through pitch decks: **no scroll animation at all** (every other site still gets the luxury smooth scroll from Section 1b). Click navigation, instant jumps, motion lives in the background or on hover. Ask which kind of site it is if unclear.
- Every animation respects `prefers-reduced-motion`.

**Tone of a section:**
- Testimonial and review sections must look **mature and editorial**, not childish: no tilted sticker cards, speech-bubble tails, big red quote badges, thick white borders or giant yellow play buttons. Use a featured review with a large quote, supporting reviews in calm panels, and small "Watch · 1:30" pills.

## 4. The client's brand is sacred

- **Never change a client's colour scheme, overall aesthetic or logo** without asking. When feedback says "it looks like AI" or "make it better", **refine within their brand**: better layout, type and details. Do **not** switch to a new visual direction. (A full redesign into a new "craft" style was rejected as "too bad, the previous was so much better".)
- Use the **real logo**, never a typed imitation of it. If the only logo available is low-resolution:
  - rebuild it cleanly: refill each letter with its exact flat colour and **retype the tagline in a matching real font**;
  - do **not** rely on AI upscaling of text, because it produces garbled, "AI-looking" letters;
  - suggest getting the original file from the client.
- When offering colour options, every option must come from the brand's own palette.

## 5. Typography and colour

- Choose fonts that fit the brand's world; self-host them (woff2, `font-display: swap`). Pair a display face with a readable body face. Keep a clear type scale.
- Avoid Inter as a default; avoid serif just to look "premium" unless the brand is truly editorial or luxury.
- Body text at least 16–18px, about 65 characters wide, with comfortable line height.
- Contrast must pass WCAG AA (4.5:1 for body text). Check text on every coloured section.
- Define colours as CSS variables; one accent used consistently.

## 6. Images and video

- Get the original-resolution files (Instagram originals, not thumbnails). AI-upscale anything under about 2000px on its long side. For faces, blend about 30% of the plain upscale back in so skin doesn't look waxy.
- Export WebP at several widths (e.g. 600/1000/1440 or 800/1200/1800) with proper `sizes`, plus explicit `width`/`height`.
- Video:
  - re-encode to 1080p H.264 with `faststart` and a sensible bitrate cap;
  - make 4-second silent previews that play on hover (desktop) or when in view (phone);
  - load full videos only when tapped (`preload="none"`), in a centred lightbox with sound and a link to the original post.
- Children: be careful with children's faces on public sites. Use covers without kids' faces where possible, and get the client's approval before going public.
- **Paid AI image or video generation costs money: say how many images and the cost, and wait for a yes** before generating anything.

## 7. Content and copy

- Use the brand's own words (captions, reviews, bio). Keep their voice, including slang.
- Real numbers only. "Over five years", not an invented "500+ happy clients".
- Testimonials: transcribe the actual video or review; quote it exactly; credit the person with context (e.g. "Parent, son's 11th birthday").
- Clear calls to action that fit how the business actually takes bookings (WhatsApp with a pre-filled message, Typeform, phone). Show the phone number as text too.
- Run copy through the `humanizer` / `stop-slop` skills: no "it's not X, it's Y", no forced lists of three, no filler.

## 8. Feedback etiquette: how to respond to change requests

- **Change exactly what was asked, nothing else.** If they approved something, don't "improve" other parts while fixing one thing.
- Keep a backup of every version; be ready to revert instantly ("the previous was better" happens).
- When feedback is vague ("make it better", "it looks bad"), make a concrete, visible improvement within the brand, show it, and explain in two or three plain sentences what changed.
- When something can't be done well (e.g. AI-upscaling every video frame would take a day), say so plainly, do the best fast version, and explain the trade-off.
- Write updates in plain, non-technical language, with no code jargon.

## 9. Quality bar: check all of this before saying "done"

Open it in a real browser (use `playwright-cli`) and verify:
- [ ] **Widths 320, 390, 768, 1440 and 1920:** no horizontal scroll at any of them.
- [ ] Console has zero errors; no 404s for files.
- [ ] Scroll works end to end with mouse wheel, trackpad, keyboard (arrows, Page Up/Down, Space) and touch. Nothing gets stuck.
- [ ] Intro or loader plays once, can be skipped by tap or key, and never blocks content for long.
- [ ] Reduced-motion mode shows a complete, calm page (nothing stuck invisible).
- [ ] Keyboard: skip link, visible focus on every button and link, logical order.
- [ ] Tap targets at least 44px; images have alt text and dimensions.
- [ ] Fast on a throttled phone: first paint under about 1.5 seconds; no render-blocking third-party CSS (self-host fonts and icons).
- [ ] Styled 404 page in the brand's look; canonical link; OG share image; favicon and app icons using the real logo.
- [ ] Run `/web-interface-guidelines` (or `web-design-guidelines`) on the page and fix what it finds.
- [ ] Section 1b is all there: personalised loader (skippable, once per visit), luxury smooth scroll that never traps, **at least 2 (ideally 4) interactive features** tested with mouse, touch and keyboard, product screens exactly one window tall (check `offsetHeight === innerHeight` at 1440×900 and 390×844), a testimonial section with real reviews (or clearly labelled samples on a concept site), and no gradient over any photo.
- [ ] Optional bar-raiser: run the `awwwards` skill's audit and aim for 6.5 or higher.

## 10. Skills to use (all included in this kit)

| When | Use |
|---|---|
| Any new website or landing page | `design-taste-frontend` (default) plus `frontend-design` |
| Want it to feel premium or agency-grade | `high-end-visual-design`, `awwwards` |
| A specific style | `minimalist-ui` (calm editorial), `industrial-brutalist-ui` (raw/technical), `gpt-taste` (heavy scroll motion) |
| Improving an existing site | `redesign-existing-projects` (and Section 4: keep the brand) |
| Design system, tokens, components | `ui-ux-pro-max`, `design-system`, `ui-styling` |
| Interaction polish (hover, press, timing, transitions) | `emil-design-eng` |
| Getting an honest critique of a design | `design-critique` |
| Landing-page structure and conversion | `landing-page-design`, `cro`, `mkt-copywriting`, `copy-editing` |
| From a screenshot or mockup to code | `image-to-code`, `imagegen-frontend-web`, `imagegen-frontend-mobile` (these generate paid images: ask first) |
| Brand boards and logo systems | `brandkit`, `brand` |
| SEO basics | `seo-audit`, `schema`, `ai-seo` |
| Writing that doesn't sound like AI | `humanizer`, `stop-slop` |
| Long code that must not be cut short | `full-output-enforcement` |
| Checking the finished page | `playwright-cli`, `webapp-testing`, `/web-interface-guidelines`, `web-design-guidelines` |
| Finding another skill for a niche need | `find-skills` |

---

### When a skill disagrees with this file
This file wins. For example, the `frontend-design` skill warns against highlighting one word in a headline and prefers a single motion moment. That's good general advice, but where this playbook asks for something (a personalised loader plus a signature interaction, a brand-coloured key word), follow the playbook.

### The short version (if you remember nothing else)
0. Every site: a personalised logo loader, luxury smooth scroll, 2–4+ real interactive features, products in exact screen-sized sets, a testimonial section (real reviews only), and no gradients over photos.
1. Research the real brand first; use their real logo, photos and words.
2. Never change the client's colours, logo or look; refine inside it.
3. One cinematic signature moment, built from the real logo or brand.
4. Bold brand colour, never plain white/black and never dull pastels.
5. No placeholders, no text over photos, no repeated photos, no confetti, no template "AI slop".
6. HD everything; real video testimonials beat any claim.
7. Mature, editorial layouts; mobile designed for swiping.
8. Change only what's asked; keep backups; preview big changes on a separate link.
9. Test at every width, every input method and reduced motion before saying done.
