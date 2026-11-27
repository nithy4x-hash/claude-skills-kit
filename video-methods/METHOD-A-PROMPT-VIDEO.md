# Method A: Prompt method (realistic video from text prompts)

> **How to use this file:** put it in your project folder and tell Claude:
> *"Read METHOD-A-PROMPT-VIDEO.md and make this video with the prompt method."*
> Everything below is written to Claude. It comes from real client work (premium real-estate walkthroughs, health-tech ads, brand reels) and from many rounds of feedback on what was approved and what was rejected.
>
> **Sister file:** `METHOD-B-STORYBOARD-VIDEO.md`. Both methods give the same kind of finished video; they differ in how the shots are planned and generated.

## Which method to use

| | **Method A: Prompt** (this file) | **Method B: Storyboard** |
|---|---|---|
| Best for | Hyper-realistic live-action: people, homes, products in real places | Animated, 3D, motion-graphics, logo reveals, or realistic films where the whole sequence must be planned visually first |
| How shots are made | Each shot's start frame is written as a text prompt (Nano Banana in Flow), then animated with a Chamundi-format prompt | ChatGPT (driven through the browser) draws the whole scenario as a storyboard; Flow animates the sequence from it |
| Control | Very high per shot: lock every face, product and room | High over sequence, framing and style continuity across shots |
| Speed | Slower: many stills, pick, animate | Faster to agree the story: one board shows everything |
| Use when | The client needs real-looking people and places, and accuracy matters (brochure facts, real products) | The client needs to see and approve the flow before anything is generated, or the look isn't photographic |

## 0. The philosophy in five lines

1. **The video must not feel like AI.** "AI slop" is the worst possible feedback: floaty motion, waxy faces, template captions, random sound effects.
2. **Every video tells a small story with a reason and stakes.** Pretty shots with no context are rejected as "contextless".
3. **People are generated from words, not from photos.** Never attach a real person's face. Describe the character in text and let Flow create them. (See Section 2.)
4. **The source image is the boss.** Every video starts from an approved still, and the prompt locks Flow to it (the "Chamundi" format, Section 4).
5. **Premium, calm and confident.** Fewer cuts, mild motion, clean type, real voice, no gimmicks.

---

## 1. The pipeline, start to finish

| # | Step | What happens | Tools and skills |
|---|---|---|---|
| 1 | Brief | Read the client brief or brochure. Facts come **only** from the client's material, never invented. Note the brand colours, fonts, logo rules and audience. | `ig-reel`, `video`, `ad-creative` for hooks and angles |
| 2 | Script + shot list | Write the voiceover script and one line per shot. **Show it before spending any credits.** | `ig-reel` (hook formulas, beat sheet), `humanizer` |
| 3 | Stills first | Generate the start frames as still images (Nano Banana in Flow). People described in text only. Generate 2 per prompt and pick the best. | Flow (Section 3) |
| 4 | Pick | Show the stills (a picker page is best) and let the user choose. | an artifact or picker page |
| 5 | Animate | Turn each chosen still into a video shot with the **Chamundi-format prompt**. | Flow: Veo / Omni (Section 4) |
| 6 | Clean | Remove the Flow ✦ sparkle and "Veo" marks (only when the user asks; keep raw marks in previews). Mute Flow's audio unless a character speaks on camera. | ffmpeg, inpaint tools |
| 7 | Film finish | Make the footage look shot on a camera, not generated. | Section 7 recipe, `color-grade` |
| 8 | Edit | One solid shot per story beat. Very mild motion. | `hyperframes`, After Effects (scripted), `capcut-edit` |
| 9 | Voice + music | ElevenLabs narration; Flow Music or Gemini music; duck music under the voice. | `media-use` |
| 10 | Motion graphics | Kinetic captions, cards, logo, end card, all inside the safe zone. | Section 9: `hyperframes`, `hyperframes-registry`, `remotion-*`, After Effects |
| 11 | Preview | Render a low-quality preview first (e.g. 960×540). Final render only when the user says so. | `hyperframes-cli`, `remotion-render` |
| 12 | Deliver | Final file in the user's Downloads, clearly named; a caption file if it's a post. | `ig-caption`, `ig-human` |

---

## 2. People: generated from the prompt, never from a face photo

- **Do not attach a photo of a real person as a face reference.** Write the person in words and let Flow invent them.
- Write a **character line** once and paste it **word for word** into every shot of that character, for example:
  > *"a dignified Tamil man in his early seventies with neat grey hair and a trimmed grey moustache, in a crisp pale-blue cotton shirt"*
- **Consistency across shots comes from the start frame, not a face reference.** Once a still is approved, that still becomes the first frame of the video, and the prompt says "same man, same face, same hair, same clothes".
- For later stills of the same character, attach the **approved generated still** (not a real photo) as an ingredient and say "same clothes, same room, same light".
- **Real-world scale:** give heights so people aren't giant or tiny ("a 1.75 m man next to a 1.55 m net post").
- **Faces:** prefer medium shots that show faces and expressions. Avoid macro shots of hands only; they read as AI.
- The person must **never "spawn out of nowhere"**: start the shot with them already in frame.
- **Children:** keep the description brief ("granddaughter in school uniform claps and cheers"). Detailed descriptions of a child's face or body get refused.
- **Policy-safe wording:** if a prompt is refused, simplify it. Drop city names next to age words, drop anything that hints at gambling, and describe hands plainly. Read the refusal text on the tile before rewriting.

---

## 3. Still-image prompt template (Nano Banana)

Write prompts as natural sentences in this order:

1. **Format:** "Vertical 9:16 photo." (or 16:9 / 3:4)
2. **Scene and action:** who, where, doing what, with what emotion. Include one specific, story-relevant detail.
3. **Framing:** "Medium shot at table height."
4. **The realism block** (always, word for word):
   > *Candid documentary photograph, not a staged advert. Shot on a full-frame camera with a 35mm lens, natural available light, true-to-life skin tones with real texture, pores, wrinkles and hair, unretouched, gentle fine film grain, natural colour, soft highlight roll-off, no HDR, no oversharpening, no glossy CGI look, no beauty filter. Anatomically correct hands. No text, no logos, no watermark.*
5. **The audience/affluence block** (match the brand), e.g. for a premium brand:
   > *Setting reads as upper-middle-class and well-off: spacious, well-kept, tastefully furnished, polished floors, good furniture, elegant well-groomed clothing. Authentically South Indian, quietly premium, never shabby, never flashy.*
6. **Dignity line** when relevant: "Older people look capable, alert and in charge, never frail or helpless."

Rules:
- **Never ask for "empty space for text".** Flow paints a flat grey band; leave space to the layout.
- **Never generate real products, logos or the founder.** Composite the real product PNGs in afterwards, or attach the product PNG as an ingredient and check it.
- **Grade every still** before text goes on it: bright and natural, not dull and not over-saturated (Section 7).

---

## 4. The Chamundi format: the video prompt (use it for every image-to-video)

This structure locks Flow to the approved image so the video never redesigns the brand, the architecture or the person. Keep the capitals; they matter.

```
The ATTACHED [START-FRAME / LOGO / RENDER] IMAGE is the MASTER VISUAL SOURCE, NOT A STYLE REFERENCE.
Create a [8]-second [vertical 9:16 / horizontal 16:9] [live-action shot / logo reveal] that continues directly from it.
OPENING LOCK: the very first frame is the attached image exactly, and the shot continues from it with no cut, no fade and no reframing.
The attached image is the EXACT [first / final] frame: same [person: face, age, hair, clothing], same [product], same [location], same light, same framing. Animate the EXISTING elements only.
DO NOT:
- [one forbidden thing per line: posing for camera, looking into the lens, changing face/age/clothes,
   redesigning/recolouring the product or logo, adding people/text/captions/logos/watermarks,
   cutting or changing camera angle]
TIMELINE:
0:00-0:03 [what happens, physically specific, real weight and pace]
0:03-0:05 [the small story beat: a glance, a smile, a reaction]
0:05-0:08 FINAL HOLD: [the resting frame]
AUDIO: none (silent).          <- unless the character must speak a line on camera
VISUAL STYLE: candid documentary realism, natural light, true-to-life skin with natural texture, gentle film grain, soft highlight roll-off.
COLOR LOCK: keep the exact colours and white balance of the attached image.
BACKGROUND LOCK: [the setting] stays exactly as in the attached image; only natural ambient motion.
LOGO LOCK: [for logo reveals: the logo's shapes, colours and proportions never change]
CAMERA: [very subtle slow push-in / steady tracking at the subject's pace]. No zoom, no rotation, no shake, no cuts.
EFFECTS: [for logo reveals only: e.g. soft light sweep, gentle shimmer on the existing gold]
NEVER: morphing or waxy face, smeared hair, extra fingers, warped hands, a product that changes shape or colour, sliding feet, slow-motion, CGI look, text of any kind.
The final frame must match the attached image [for logo reveals and end frames].
If there is ANY conflict between this prompt and the attached image, ALWAYS prioritise the attached image.
```

**Real example (approved):**
```
The ATTACHED START-FRAME IMAGE is the MASTER VISUAL SOURCE, NOT A STYLE REFERENCE.
Create an 8-second vertical 9:16 live-action shot that continues directly from it.
OPENING LOCK: the very first frame is the attached image exactly, and the shot continues from it with no cut, no fade and no reframing.
The attached image is the EXACT first frame: same man, same face, same grey hair and moustache, same light blue shirt with rolled sleeves, same beige trousers, same blue pendant on its dark cord, same temple street, same flower stall, same morning light, same framing. Animate the EXISTING scene only.
DO NOT:
- stop walking, stand still or pose for the camera
- look straight into the lens
- change his face, age, hair, moustache or clothing
- redesign, resize or recolour the blue pendant
- add new people in the foreground, text, captions, logos, signs or watermarks
- cut, change scene or change camera angle
TIMELINE:
0:00-0:03 He keeps walking toward camera with a relaxed, upright, unhurried stride, arms swinging naturally, real weight shifting with each step.
0:03-0:05 Still walking, he turns his head toward the flower stall on the right and gives a small warm smile.
0:05-0:08 FINAL HOLD: he looks ahead again and keeps walking at the same easy pace, the pendant swaying gently with his steps.
AUDIO: none (silent).
VISUAL STYLE: candid documentary realism, natural warm morning light, true-to-life South Indian skin with natural texture, gentle film grain, soft highlight roll-off.
COLOR LOCK: keep the exact colours and white balance of the attached image.
BACKGROUND LOCK: the temple, trees and stall stay exactly as in the attached image; only natural ambient motion of leaves and a few distant passers-by.
CAMERA: handheld-steady backward tracking shot matching his walking pace, keeping him the same size in frame. No zoom, no rotation, no shake, no cuts.
NEVER: morphing or waxy face, smeared hair, extra fingers, warped hands, a pendant that changes shape or colour, sliding feet, slow-motion, CGI look, text of any kind.
If there is ANY conflict between this prompt and the attached image, ALWAYS prioritise the attached image.
```

**Extra locks when needed:**
- **"LOCKED SHOT"** for architecture and real-estate renders: the camera glides, but walls, windows and furniture never warp.
- **"a completely different camera position"** if a new shot copies the reference framing.
- **Dialogue:** if a character must say a line, write it exactly in quotes, set AUDIO to that line, and use the clip's own audio in the edit (it lip-syncs best).

---

## 5. Running Google Flow (and driving it from the browser)

**Models and settings**
- Stills: Nano Banana (Pro or 2.1): 9:16, 16:9 or 3:4, ×2 per prompt.
- Video:
  - **Veo 3.1 Lite** is the cheapest (720p, 8 s).
  - **Omni Flash** is the best for people and dialogue, but costs more.
  - Pick per shot and tell the user the credit cost before generating a batch.
- Settings → **"Return silent videos" ON** (audio generation fails often). Turn it off only for dialogue shots.
- **Music:** Flow has **Flow Music**. As a fallback, Gemini → Create music (Instrumental, Short).

**Driving Flow with Claude in Chrome**
- **Never type into Flow's prompt box key by key; it freezes the tab.** Put the prompt on the clipboard (PowerShell `Set-Clipboard`), click the box, press Ctrl+V, wait about 6 s, then click the submit arrow.
- To set a start frame: on the still, open More options → **Animate**. Before submitting, check that the attached start frame really is the chosen still (tile order changes after a reload).
- Download each video via More options → Download → the "Original size" option.
- **Prepare every prompt in a `prompts.json` first** (id, aspect, ingredient, prompt), then run them one by one.
- If Flow says it noticed **unusual activity**, stop and let the user generate by hand. Never try to get around it.
- Every Flow still and video carries a small ✦ sparkle in the bottom-right corner (plus "Veo" on Veo clips). Keep it in previews. Remove it in finals **only if the user asks**: track it and inpaint, or un-blend it when it's a fixed overlay.

---

## 6. The edit: what gets approved

- **One solid continuous shot per story beat.** No rapid sub-cuts: about 5–7 cuts in a 20-second video.
- **Motion on stills or shots:** a very mild linear drift (3–4% over the whole shot, no easing) or a held frame. **No punch-in zooms, no whip pans, no light flares** on premium brands.
- **Transitions:** clean cuts on the music beat, or soft dissolves on premium brands. A match cut through an object on screen is great.
- Don't start on a frame where the presenter pops into the shot.
- **Sound:**
  - Voice plus music only.
  - **No random SFX** (whooshes, taps, chimes, vinyl).
  - The only SFX allowed are sounds tied to the song itself, or UI sounds tied exactly to on-screen motion, and only when asked.
- **Every second informative:** each shot shows something the voice is talking about.
- **Approved videos:** if a fix is requested on a finished video, **change exactly that one thing**. Prove nothing else moved by comparing frames against the delivered render.

---

## 7. Film finish and grade (the "less AI" recipe)

**Footage film finish** (apply before the edit):
- **Upscale and denoise:**
  - Upscale 720p → 1080p with Lanczos and **no sharpening**. On native 1080p, apply a tiny blur (σ about 0.6).
  - Temporal-only denoise (hqdn3d) to calm AI texture flicker.
- **Highlights:**
  - A highlight shoulder curve so highlights roll off like film, not like a phone.
  - Halation: threshold 0.8 → red-orange tint → blur 16 → screen at 0.3.
- **Grain:** luma-only, fresh every frame and different per clip. "Felt, not seen" on video.
- **Frame rate:** render at **24 fps**; bake speed changes in with frame blending.
- **Don't add:** fake chromatic aberration or gate weave.

**Grade:**
- **Target:** **bright and natural**, between vivid and dull. A working middle setting: vibrance +0.12, saturation 0.98, contrast 1.05, brightness +0.03, gamma 1.05, a touch of warmth.
- **Too dull is rejected:** users said "very dull", so lift it.
- **Too saturated is rejected too:** users said "too saturated", so pull back.
- **Graphics:** grade the footage only, so graphics keep their exact brand colours.
- **Stills for posts:** grade, then add visible grain **after** resizing to the final size.
- The `color-grade` skill can match a reference image or a film look and export a LUT.

---

## 8. Voice and music

- **Every video gets narration.** Silent edits feel empty. Use ElevenLabs with one consistent voice per video.
  - Warm premium male narrator: *"Viraj – Warm Luxury Brand Narrator"*.
  - Relatable female: *"Neha – Messy and Relatable"*.
  - Calm older male: *"Shayne – Calm, Natural and Comforting"*.
- **Keep narration sparse.** Short lines, and **never read out the on-screen text**.
- To fix one word, regenerate the whole paragraph and splice in only that phrase.
- **Music:**
  - Duck it under the voice (about −25 dB under VO); loudness −14 LUFS; limiter at −1.5 dB.
  - Cut on bars of the music.
- **Voice quality:**
  - Clean dialogue with a voice-enhancement model.
  - **Always check lip sync** against the picture; it's the first thing that gets noticed.

---

## 9. Motion graphics: the style and the tools

**The signature caption style** (creator-reel kinetic type):
- Captions **synced to the voice word by word**.
- A small white **lead-in word** above a **huge bold keyword** in the brand accent colour (or bold italic), centred mid-frame.
- Upcoming words show in **grey** until spoken.
- Between talking shots: quick **black cards with a 3D object** popping in beside the keyword (an object that comes from the story: hourglass, magnet, briefcase).
- **Rounded picture-in-picture cards** pop in under a caption.
- **Vary the type treatment per beat.** The same animation on every line reads as a template.

**Graphic elements that work:**
- UI cards: notification cards, chat bubbles, star ratings that pop in with rising energy, a leaderboard that re-sorts live, score cards with count-up numbers.
- **Text behind the presenter:** the big keyword sits behind the person. It needs a **crisp, opaque matte**; soft see-through edges were rejected.
- Tracked graphics: rings, leader lines and labels pinned to a moving product.
- Hologram/blueprint overlays for real estate, key words flying in with fast-in, slow-out easing and motion blur.
- A clean end card with the logo, the one call to action, and the price or offer if the brief has one.

**Premium variant** (luxury real estate, high-end brands):
- Elegant serif display type (e.g. Perpetua Titling) with a clean sans for labels.
- Ivory and champagne-gold palette; logo in a mono ivory/gold version.
- Soft feathered scrims behind text, never hard boxes; freeze-dissolves; no pop-in captions; no SFX.
- **Every label holds at least 1.5 seconds.**
- Rejected as "very local": loud heavy fonts, yellow pop words, dot pills, flares, whips, labels that flash for 0.2 s, text spilling out of boxes.

**Brand and logo rules:**
- Use the brand's exact colours and fonts.
- Use the **real logo file**, never AI-generated or redrawn.
- Trademark symbols (™) appear on the logo artwork only, never in plain text.

**Instagram/Reels safe zone (1080×1920)** for all text and graphics on new reels:
- Nothing above y 250 or below y 1500; left margin 70.
- Right margin 55 from y 250 to 860, then **193** from y 860 to 1500 (the like/comment/share column). Lower-half content ends by x 887.
- Shorts captions: keep them above about 76% of the height.
- Check with a drawn overlay on rendered frames before delivering.

**Which skills to use for motion graphics**

| Need | Skill |
|---|---|
| Building the whole video in HTML (captions, cards, charts, end cards, transitions) and rendering to MP4 | `hyperframes` (read first), `hyperframes-cli` |
| Ready-made blocks: kinetic type, caption styles, transitions, overlays, charts, 3D, camera moves | `hyperframes-registry` (check it before hand-building any effect) |
| Music, SFX, voiceover, icons, logos, cut-outs, colour looks | `media-use` |
| Bringing a Figma design or brand frames into the video | `figma` |
| React-based motion (programmatic captions, data-driven scenes) | `remotion-best-practices`, `remotion-create`, `remotion-captions`, `remotion-markup`, `remotion-render` (+ `remotion-docs`) |
| Moving a Remotion/AE/Lottie piece into HyperFrames | `remotion-to-hyperframes` |
| Editing in CapCut (subtitles, speed, keyframes, cutting long into shorts) | `capcut-edit` |
| Matching a grade to a reference or film look, exporting a LUT | `color-grade` |
| Reel hooks, script, on-screen text, beat sheet | `ig-reel` |
| Caption for the post, hashtags | `ig-caption`, then `ig-human` / `humanizer` |
| Carousel or story versions of the same idea | `ig-carousel`, `ig-story`, `ig-repurpose` |
| Ad angles, hooks and variations | `ad-creative`, `video` |
| Brand boards, look and feel | `brandkit`, `canvas-design` |
| A live presentation version | `slideshow` |

**After Effects** is also used, driven by script (no clicking). Generate ExtendScript from word timings and render with `aerender`. It's best for:
- word-synced karaoke captions
- trim-path ticks and star pops
- tracked call-outs
- matte-heavy "text behind subject" shots

Save scripts as UTF-8 with BOM so ₹ and ™ survive.

---

## 10. Review and delivery

- **Announce each creative** before working on it: "Now: Creative 02, Instagram Reel, 25 s, 'Title'".
- **Show before you spend:** script and shot list → stills → low-res preview → final.
- Check every final with ffprobe:
  - the resolution;
  - 24 fps;
  - an audio stream that runs the full length (a mixing bug once cut the audio short);
  - lip sync;
  - the safe-zone overlay.
- Deliver to the user's **Downloads**, named clearly: `Brand_DD-Mon-YYYY_Format_NN_Title.mp4`, plus `_caption.txt` for posts.
- Keep backups of every approved version, so "the previous one was better" can be restored instantly.
- **Paid generation costs money:** say how many clips or images and the credit cost, and wait for a yes on big batches.

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
1. Story first: a small moment with stakes, facts only from the client.
2. People written in words, never a real face photo; consistency comes from the approved still.
3. Stills first, pick, then animate with the **Chamundi format** (master source, DO NOT, timeline, locks, NEVER, prioritise the image).
4. One solid shot per beat, mild drift, no flashy transitions, no random SFX.
5. Film finish, plus a bright-natural grade at 24 fps.
6. Narration on everything; music ducked; check lip sync.
7. Kinetic word-synced captions and story-driven cards, inside the safe zone, in the brand's colours.
8. Preview low-res first, deliver to Downloads, keep backups, change only what's asked.
