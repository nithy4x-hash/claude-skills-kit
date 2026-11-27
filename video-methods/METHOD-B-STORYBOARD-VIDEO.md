# Method B: Storyboard method (ChatGPT storyboard → Google Flow video)

> **How to use this file:** put it in your project folder and tell Claude:
> *"Read METHOD-B-STORYBOARD-VIDEO.md and make this video with the storyboard method."*
> Everything below is written to Claude.
>
> **Sister file:** `METHOD-A-PROMPT-VIDEO.md` (the prompt method). Same finished result, different route.
> Use **Method B** for animated, 3D, motion-graphics and logo videos, and for any video (including hyper-realistic) where the whole sequence should be seen and approved as pictures before generating. See the comparison table in Method A.

---

## 0. The idea in one paragraph

Instead of writing a separate image prompt for every shot, you **describe the whole scenario once to ChatGPT**, which draws it as a **storyboard**: numbered panels showing every shot in order, in the final look (hyper-realistic, 3D animated, 2D motion graphics, logo reveal, etc.). The user approves the board. Then the storyboard goes into **Google Flow**, which is told to generate the video **following the sequence of the storyboard**, in the chosen aesthetic. The board fixes the story, framing, characters and style, so every shot stays consistent.

Everything in this method runs **through the user's own browser** (Claude in Chrome): their logged-in ChatGPT and their logged-in Flow. Claude drives both.

---

## 1. The pipeline

| # | Step | Where | Output |
|---|---|---|---|
| 1 | Brief and scenario | Claude | Scenario, beats, duration, aspect ratio, aesthetic, brand rules |
| 2 | Shot list | Claude | One line per panel (shot number, camera, action, time) |
| 3 | Storyboard | ChatGPT (browser) | One storyboard sheet, or one image per panel |
| 4 | Approve | User | Board approved, or panels regenerated |
| 5 | Prepare panels | Claude (local) | Panels cropped, upscaled, named `p01.png`… |
| 6 | Generate video | Flow (browser) | Clips that follow the board's sequence |
| 7 | Finish | Claude (local) | Edit, voice, music, motion graphics, grade, captions |
| 8 | Preview → final → deliver | Claude | Low-res preview first, final into Downloads |

---

## 2. Step 1–2: the scenario and the shot list

Before opening ChatGPT, write and show the user:

- **Scenario:** 3–5 sentences: who, where, what happens, what changes, how it ends. A small story with a reason and stakes, never just pretty shots.
- **Specs:** duration (e.g. 20 s), aspect (9:16 for Reels/Shorts, 16:9 for YouTube and walkthroughs), aesthetic (see Section 7), brand colours and logo rules.
- **Shot list:** 4–9 panels for a 15–30 s video. One line each:
  `P1 | 0:00–0:03 | wide, slow push-in | the family arrives at the gate at dusk`
- **Character line(s):** one fixed description per character, written in words (no real face photos). Example: *"a confident Tamil woman in her mid-thirties, shoulder-length wavy hair, mustard silk-cotton saree"*. It is reused word for word in every prompt.
- **Facts:** only from the client's brief or brochure. Never invent claims, prices or features.

Get a quick OK on the scenario and shot list. It's cheap to change now and expensive later.

---

## 3. Step 3: the storyboard in ChatGPT (through the browser)

### Driving ChatGPT
- Use the user's own logged-in ChatGPT in their Chrome (Claude in Chrome). **Never enter passwords or verification codes.** If ChatGPT asks the user to log in, or says a usage or image limit is reached, stop and tell the user.
- Open a **new chat** for each project so earlier conversations don't leak into the style.
- **Paste, don't type:** put the prompt on the clipboard (PowerShell `Set-Clipboard`), click the message box, press Ctrl+V, then send. Long prompts typed key by key are slow and fragile.
- Wait for the image to finish (it can take a minute), then **download it** with the image's download button. Save it as `storyboard/board_v1.png` in the project.
- Regenerate single panels in the same chat ("Redo panel 4 only: …") so characters stay consistent.

### Storyboard prompt (paste into ChatGPT)

```
Create a storyboard for a [20]-second [vertical 9:16 / horizontal 16:9] video.

AESTHETIC: [hyper-realistic live-action film still / 3D animated feature-film style / clean 2D motion-graphics / premium logo reveal]. Every panel must look like a frame from the FINAL video in this aesthetic, not a sketch.

LAYOUT: one image with [6] panels in a [2 columns x 3 rows] grid, in reading order (left to right, top to bottom). Each panel is [9:16] with a thin white gutter between panels. Put a small number (1-6) in the top-left corner of each panel and nothing else written inside the panels.

CHARACTERS (identical in every panel):
- [character line, word for word]

LOCATION AND LIGHT: [setting, time of day, light quality], consistent across all panels.
BRAND: colours [#hex, #hex]; [no logos / the logo appears only in the last panel].

PANELS:
1. [wide / medium / close-up], [camera move]: [what happens]
2. ...
6. FINAL: [the resting end frame]

RULES: same characters, same clothes, same location and same colour palette in every panel. Realistic hands and faces. No speech bubbles, no captions, no watermarks, no text except the panel numbers.
```

**Two output options:**
- **Board sheet** (one image, all panels): fastest to review and best for continuity. Use it for review and as a Flow reference. The panels are small, so **upscale them** before using any as start frames (Step 5).
- **Panel-by-panel** (one image per panel, asked one after another in the same chat): best quality. Use when panels will become Flow start frames. Prompt: *"Now render panel 1 alone as a full-resolution [9:16] image, exactly as in the storyboard."* Then repeat for each panel.

---

## 4. Step 4–5: approve and prepare

- Show the board to the user (a picker page with numbered panels is ideal). Change only the panels they ask about.
- Cut the sheet into panels locally (detect the white gutters, or crop the grid evenly). Trim the panel numbers off the corners.
- Upscale every panel to at least the video's size (e.g. 1080×1920), using AI upscale for small panels. Grade lightly so the panels match each other.
- Name them `p01.png … pNN.png` with unique filenames per project (Flow lists uploads by filename).

---

## 5. Step 6: generating the video in Flow

### Uploading
- Upload the board and/or the panels to the Flow project. If the file picker can't be used from the browser, add a hidden file input with JS, fill it, then drop the files onto the empty project area (this works best right at the start of a new project).
- **Never type into Flow's prompt box key by key.** It freezes. Paste from the clipboard and press submit.
- If Flow says it noticed **unusual activity**, stop and let the user continue by hand.

### Two routes inside Flow (pick per project)

**Route B1: the whole storyboard as an ingredient → one sequence clip** (short videos of 8–10 s, a single continuous action, logo reveals)
- Model: one that accepts reference images/ingredients (Omni).
- Attach the storyboard sheet as an ingredient and use the **storyboard sequence prompt** below.
- Known behaviour: ingredient clips can open on the reference image for about 1 second, then cut. Add the OPENING LOCK line and trim the head in the edit.

**Route B2: each panel as a start frame → one clip per panel** (anything longer than about 10 s, and anything that must be high quality; recommended default)
- Model: Veo (cheapest, 8 s) or Omni (best for people and dialogue). Settings → "Return silent videos" ON.
- On each panel: More options → **Animate**. Check that the attached frame really is that panel before submitting.
- Use the **per-panel prompt** below, which is the Chamundi format with the storyboard as the plan.
- Then cut the clips together in panel order in the edit.

### Storyboard sequence prompt (Route B1)

```
The ATTACHED STORYBOARD is the MASTER SEQUENCE and MASTER VISUAL SOURCE, NOT A STYLE REFERENCE.
Create a [10]-second [vertical 9:16] [hyper-realistic live-action / 3D animated / 2D motion-graphics] video that plays the storyboard panels IN ORDER, 1 to [N], as one continuous film.
OPENING LOCK: the video opens directly on the scene of panel 1, full-frame. Never show the storyboard sheet, the grid, panel borders, white gutters or panel numbers at any time.
SEQUENCE:
0:00-0:02 Panel 1: [what happens, camera move]
0:02-0:04 Panel 2: [...]
...
0:08-0:10 FINAL HOLD on panel [N]: [the end frame]
TRANSITIONS: [smooth continuous camera move / clean cuts on action] between panels.
CHARACTER LOCK: [character line]: same face, hair and clothes as in the storyboard in every shot.
STYLE LOCK: keep the storyboard's exact aesthetic, lighting and colour palette.
DO NOT:
- show the storyboard layout, panel numbers, captions or any text
- add characters, objects or locations that are not in the storyboard
- change the order of the panels
- add logos or watermarks [except the brand logo in the final panel]
CAMERA: as drawn in each panel, smooth and slow. No shake, no rotation, no crash zooms.
NEVER: morphing faces, extra fingers, warped hands, flickering textures, sliding feet, melting shapes, text artefacts.
If there is ANY conflict between this prompt and the storyboard, ALWAYS prioritise the storyboard.
```

### Per-panel prompt (Route B2: the Chamundi format)

```
The ATTACHED START-FRAME IMAGE (storyboard panel [3]) is the MASTER VISUAL SOURCE, NOT A STYLE REFERENCE.
Create an [8]-second [vertical 9:16] [aesthetic] shot that continues directly from it.
OPENING LOCK: the very first frame is the attached image exactly, with no cut, no fade and no reframing.
The attached image is the EXACT first frame: same [character], same [clothes], same [location], same light, same framing. Animate the EXISTING scene only.
DO NOT:
- [one forbidden thing per line]
TIMELINE:
0:00-0:03 [the action of this panel]
0:03-0:06 [the small beat that leads into panel 4]
0:06-0:08 FINAL HOLD: [a frame close to the start of panel 4, so the cut flows]
AUDIO: none (silent).
VISUAL STYLE: [aesthetic, light, texture]
COLOR LOCK: keep the exact colours of the attached image.
BACKGROUND LOCK: [setting] stays exactly as in the attached image.
CAMERA: [as drawn in the panel: slow push-in / steady track]. No zoom, no rotation, no shake, no cuts.
NEVER: morphing or waxy faces, extra fingers, warped hands, sliding feet, CGI glitches, text of any kind.
If there is ANY conflict between this prompt and the attached image, ALWAYS prioritise the attached image.
```

**Continuity trick:** end each panel's clip on a frame that leads into the next panel (same direction of movement, same eye-line), so the cuts feel like one film.

---

## 6. Step 7–8: finishing (same as Method A)

- **Clean:**
  - Mute Flow's audio unless a character speaks.
  - Remove the ✦ sparkle and "Veo" marks only when the user asks (keep them in previews).
- **Edit:**
  - **One solid shot per beat**, about 5–7 cuts per 20 s.
  - Very mild drift (3–4%) or held frames; no punch-ins, whips or flares on premium brands.
  - Cut on the music beat.
- **Look:**
  - **Realistic:** the film finish: no sharpening, temporal denoise, highlight roll-off, gentle halation, luma grain, 24 fps.
  - **Animated or motion graphics:** skip grain and halation. Keep colours exact and clean, render at 24 or 30 fps, and keep lines crisp.
  - **Grade:** bright and natural, never dull and never over-saturated. Grade the footage only, so graphics keep exact brand colours.
- **Sound:**
  - ElevenLabs narration on every video: one consistent voice, sparse lines, never reading out the on-screen text.
  - Flow Music or Gemini music, ducked under the voice; −14 LUFS.
  - No random SFX; only sounds tied to the song or to on-screen motion, and only when asked.
- **Motion graphics:**
  - Word-synced kinetic captions: a small white lead-in word, a huge accent keyword, grey upcoming words.
  - Story-driven cards (3D objects, UI cards, count-ups) and a clean end card with the real logo.
  - All inside the **Reels safe zone** (1080×1920: nothing above y 250 or below y 1500; left 70; right 55 above y 860 and 193 below it).
- **Review:**
  - Announce each creative first.
  - Low-res preview → final only on a yes.
  - Check resolution, fps, the full-length audio stream, lip sync and the safe zone.
  - Deliver to Downloads as `Brand_DD-Mon-YYYY_Format_NN_Title.mp4`.
  - Keep backups; on approved videos change only what's asked.

---

## 7. Aesthetic presets (fill the AESTHETIC line with one of these)

| Aesthetic | Storyboard wording (ChatGPT) | Flow wording | Finish |
|---|---|---|---|
| **Hyper-realistic** | "hyper-realistic live-action film still, shot on a full-frame camera, 35mm lens, natural light, true-to-life skin texture, gentle film grain" | "candid documentary realism, natural light, real skin texture, soft highlight roll-off" | Film finish + grain, 24 fps |
| **3D animated** | "high-end 3D animated feature-film style, soft global illumination, rounded appealing characters, rich but natural colours" | "3D animated film style exactly as the storyboard, smooth character animation, consistent materials" | No grain; clean; 24 fps |
| **2D motion graphics** | "clean flat 2D motion-graphics frames, bold shapes, brand colours [#hex], generous negative space, no gradients" | "2D motion-graphics animation, shapes and elements move with smooth easing, no 3D, no texture" | Crisp; exact colours; often finished in HyperFrames instead |
| **Logo reveal** | "premium logo reveal frames: the logo [describe] assembling from [material] on [background]" (attach the real logo) | the Chamundi format with **LOGO LOCK**: shapes, colours and proportions never change; the final frame matches the logo exactly | Exact colours; no grain on the logo |
| **Illustrated / collage** | "editorial illustrated collage, paper texture, cut-out shapes, bold outlines" | "animated illustrated collage, paper cut-outs move and slide, paper texture stays" | Light paper grain |

**Never** name or copy a specific film studio, show or character in prompts. Describe the qualities instead.

**Logos are never AI-redrawn in the final.** For logo reveals, the last frame must be the real logo file. Composite it in the edit if Flow's version drifts.

---

## 8. Skills to use

| Job | Skill |
|---|---|
| Scenario, hook, beat sheet, script | `ig-reel`, `video`, `ad-creative`, `humanizer` |
| Writing the storyboard plan as a file (frames, reads, sound) | `hyperframes` (its storyboard format: `STORYBOARD.md`) |
| Driving ChatGPT and Flow in the browser | `chrome-browser` (Claude in Chrome) |
| Picker page for approving the board | `artifact-design` |
| Building the motion graphics, captions and end card | `hyperframes`, `hyperframes-registry`, `hyperframes-cli`, `media-use` |
| Programmatic animation instead of generated video (pure 2D motion graphics) | `remotion-create`, `remotion-markup`, `remotion-captions`, `remotion-render`, or HyperFrames directly |
| Grade and LUT | `color-grade` |
| CapCut edit or quick subtitles | `capcut-edit` |
| Brand look boards | `brandkit`, `canvas-design` |
| Post caption | `ig-caption`, `ig-human` |

**Tip:** for **pure motion-graphics videos** (text, shapes, charts, UI), the storyboard can be built directly in HyperFrames instead of generated in Flow. That gives exact brand colours and sharp text, which AI video can't guarantee. Use Flow for the parts that need generated footage or characters.

---

---

## Instagram content and video-editing skills: the full kit, step by step

Every video made with this method usually ends up on Instagram (Reel, Story, carousel cut-down) and often YouTube Shorts too. Use these installed skills at the matching step. On Windows, run the skills' scripts with `python` (their docs say `python3`).

### A. Before making anything: decide what to make

| Step | Skill | What to do with it |
|---|---|---|
| Plan the week or the campaign | `ig-plan` | Picks what to post, which format (Reel, carousel, story), when, and the hook formula for each post. |
| See what's working in the niche right now | `ig-viral` | Finds reels that beat their own account's average, names each one's hook formula, and builds a swipe file (`swipe.py`). **Copy the formula, never the video.** |
| Learn from the account's own past posts | `ig-audit` | Reads Instagram insights: hold at 3 s (the hook's grade), saves, shares. Says what to make more of and what to stop. |
| Turn one long asset into many posts | `ig-repurpose` | One YouTube video, podcast, client call or brochure becomes a week of reels and carousels, each with a different hook. |
| Strategy, angles, offers | `content-strategy`, `social`, `video`, `ad-creative`, `marketing-psychology` | Content pillars, ad angles, hooks for paid video, honest persuasion. |

### B. Script and hook: before generating any footage

| Step | Skill | What to do with it |
|---|---|---|
| Hook + script + on-screen text + beat sheet | `ig-reel` | Write 3–5 hooks from its 26 formulas (`hooks.json`); rank them with `hookscore.py`; build a timed beat sheet with `beats.py script.txt --target 30`. **A Reel has two hooks at once: the first thing said (about 2 s) and the first thing on screen (about 1 s); they are not the same sentence.** |
| Make every word sound human | `ig-human`, `humanizer`, `stop-slop` | `humanize.py draft.txt --report` strips em dashes, AI words and invisible watermark characters; `detect.py` scores it. Run it on the script, on-screen text and caption. |

The beat sheet from `ig-reel` becomes the **shot list** (Method A) or the **storyboard panels** (Method B). One beat = one shot.

### C. Make the video (generation is covered above; this is the editing kit)

| Job | Skill | Notes |
|---|---|---|
| Edit and assemble the whole video in code (captions, cards, transitions, end card) and render to MP4 | `hyperframes` (read first), `hyperframes-cli` | The main editor. Low-res preview first, final on approval. |
| Ready-made effects: kinetic type, caption styles, transitions, overlays, charts, 3D, camera moves | `hyperframes-registry` | About 450 blocks. **Check here before hand-building any effect.** |
| Music, sound effects, voiceover, icons, logos, cut-outs, colour looks; footage that looks dark or flat | `media-use` | Also for fixing dull footage and mixing placed audio. |
| Brand frames or a design from Figma into the video | `figma` | |
| React-based motion graphics (data-driven scenes, programmatic captions) | `remotion-create`, `remotion-markup`, `remotion-captions`, `remotion-interactivity`, `remotion-maps`, `remotion-multimedia`, `remotion-render`, `remotion-studio`, `remotion-docs`, `remotion-best-practices`, `remotion-upgrade`, `remotion-saas` | Use when a piece is built in Remotion. |
| Move a Remotion, After Effects, Lottie or canvas piece into HyperFrames | `remotion-to-hyperframes` | Checks frame by frame against the original. |
| Edit inside CapCut: subtitles, timing, speed, keyframes, cutting long into shorts | `capcut-edit` | For when the user wants a CapCut project they can open and tweak. |
| Grade to match a reference or film look; export a LUT | `color-grade` | Grade footage only; graphics keep exact brand colours. |
| After Effects (scripted, headless) | (no skill; driven by script) | Best for word-synced karaoke captions, trim-path ticks, tracked call-outs and text behind the subject. |
| A live presentation version of the video | `slideshow` | |
| Animated GIF stickers for Stories or Slack | `slack-gif-creator` | |

### D. The other Instagram formats from the same shoot

| Format | Skill | Spec |
|---|---|---|
| **Reel** | `ig-reel` + the edit kit above | 1080×1920, 9:16. Safe zone: nothing above y 250 or below y 1500; left 70; right 55 above y 860 and **193** below it (the like/comment/share column). Hook in the first 1–2 s. |
| **Reel cover** | `image`, `banner-design`, `design` | 1080×1920. Keep the title in the centre 1080×1350 area so it survives the profile-grid crop. |
| **Carousel** | `ig-carousel` | 1080×1350 (4:5), up to 20 slides. Cover = the hook in 6 words or fewer; one idea per slide; build as HTML and export. Use stills or frames from the video. |
| **Stories** | `ig-story` | 1080×1920; keep text in the middle (not above y 250 or below about y 1500); a frame-by-frame sequence with the right sticker for each job (poll, question, link). |
| **Static post / banner / social graphic** | `banner-design`, `design`, `canvas-design`, `image` | Brand colours and real logo; real product shots, never AI-redrawn products. |
| **YouTube Shorts** | the Reel file | Same 1080×1920; keep captions above about 76% of the height. |

### E. Publish and grow

| Step | Skill | What to do with it |
|---|---|---|
| Caption, search terms, hashtags | `ig-caption` | The first line must survive the "… more" cut; one clear ask; about 3 hashtags; lint it with `caption.py caption.txt --keywords "..."`. Then `ig-human`. |
| Profile that converts the views | `ig-profile` | Scores the profile out of 100 and rewrites bio, highlights and pinned posts. |
| Comments on other accounts (daily engagement round) | `ig-comment` | Comments that read like a person with an opinion. |
| Replies under your own posts | `ig-reply` | Sorts which comments are worth answering; handles critics and leads. |
| DMs from the post (keyword delivery, follow-ups, collab pitches) | `ig-dm` | Only to people who raised their hand. **Never send DMs without the user's approval.** |
| Check what worked, then plan the next one | `ig-audit` → `ig-plan` | Close the loop every week. |

### F. The combined workflow in one line
`ig-plan` / `ig-viral` → `ig-reel` (hooks + beat sheet) → shot list or storyboard → generate (this method) → `hyperframes` + `hyperframes-registry` + `media-use` (edit, captions, sound) → `color-grade` → safe-zone check → `ig-carousel` / `ig-story` cut-downs → `ig-caption` + `ig-human` → post → `ig-reply` / `ig-comment` / `ig-dm` → `ig-audit`.

### The short version
1. Write the scenario, specs and shot list; get a quick OK.
2. ChatGPT draws the storyboard in the final aesthetic (paste the prompt; download the board).
3. User approves; cut, upscale and name the panels.
4. Flow: either the whole board as an ingredient (short, single action), or each panel as a start frame with the Chamundi prompt (recommended).
5. Finish exactly like Method A: one solid shot per beat, the right finish for the aesthetic, narration, ducked music, kinetic captions in the safe zone, preview first.
