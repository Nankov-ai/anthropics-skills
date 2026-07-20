# blocks.md — the six-block vocabulary

The canonical skeleton for every nano-edit prompt. Pull blocks per mode; these are choices, not a checklist. Order is fixed (1→6) within generative modes; REFRAME has its own structure (see SKILL.md).

Table of contents:
1. LOCK
2. SUBJECT
3. CAMERA / OPTICS
4. FRAMING
5. LIGHTING
6. RENDER / MATERIAL
7. Consistency token kit
8. Platform nuances

---

## 1. LOCK — the consistency anchor

The instruction that tells the model the reference is truth. Built from a stem + stacked "same" axes. Each axis pins one thing the model would otherwise drift on.

**Stem:** `Recreate the exact [object] from the reference image —`

**Axes to stack** (pick the ones that matter; more axes = tighter lock):
- `same design` — overall form/silhouette
- `same materials` — metal, fabric, stone, surface
- `same proportions` — relative sizes, thickness, scale
- `same [feature] placement` — where the diamonds/text/logo/seam sits
- `same color`
- `same finish` — polish, matte, brushed, patina

**Orientation tail (optional):** how the object sits. `positioned upright at a slight angle to showcase the [feature]` / `hanging naturally, showing the full chain` / `lying flat, top face toward camera`.

**ASSEMBLE adds a second lock per asset:**
`Use the exact same [asset] from the [asset] reference — same [traits].`
Phrase the asset name identically everywhere it appears across the series. "the rose gold diamond PAPI ring" stays exactly that string in every prompt — never "the gold ring" in one and "the PAPI band" in another. Drift in the name = drift in the asset.

**Why repetition is not redundancy:** each "same" is a separate constraint token. Three "same"s lock three axes; the model is free on everything unlocked. This is how you control *what* transfers from the reference and what the model may reinterpret.

---

## 2. SUBJECT — dense physical description

Texture before adjectives. Describe what a macro lens would resolve, not how it makes you feel.

**For products (jewellery, objects):** every feature that must survive the generation. Material state (polished/brushed/cast), structural detail (openwork, prongs, links, seams), any text/typography (quote it: `the word "PAPI" fully visible in openwork`), accents (`single black diamond at the top`), edge/extent (`the entire ring from left curve to right curve, front face and both sides visible`).

**For food (the recurring hero):** the physical-truth vocabulary that reads as real, not rendered —
- *Raw meat:* `dense marbling with thick veins of white fat`, `visible muscle fiber grain on the surface`, `the fat cap along the edge irregular and natural with rough texture`, `moist tactile quality`, `individual muscle striations`, `soft creamy opacity of the fat against wet bright red meat`, `edges slightly uneven from the butcher's hand`.
- *Cooked meat:* `deep dark pepper-crusted exterior`, `charred edges rendered and golden`, `sliced to reveal juicy medium-rare centers — pink-red, glistening`, `warm juices pooling`, `flakes of coarse sea salt catching the light`, `a pat of herb butter melting slowly`.

**Faithful-mode discipline (ISOLATE / REFRAME):** describe only what's in the reference. Don't add marbling that isn't there, don't invent prongs. ASSEMBLE's hero can be described richly because you're building it.

---

## 3. CAMERA / OPTICS — the series token

The line that makes a set cohere. Body + lens + aperture + sharpness intent.

**Aperture by mode:**
- ISOLATE → **f/8–f/11**. Everything sharp, edge to edge, for reuse as an asset. `the entire object uniformly sharp, every surface in focus from front to back`.
- ASSEMBLE → **f/4–f/5.6**. Enough depth to keep the hero crisp while letting background fall off slightly. `razor sharp optics with extreme detail rendering, edge-to-edge crispness`.
- REFRAME → inherit the original's DOF feel; don't re-specify aperture, say `same depth-of-field feel`.

**Body + lens registers** (pick one and freeze it across the series):
- Clean product/catalog: `Shot with 50mm lens at f/8`
- Cinematic editorial: `Cinematic film still shot on ARRI ALEXA Mini with Zeiss Master Primes 50mm lens at f/5.6 — razor sharp optics, extreme detail rendering. Full frame edge to edge.`
- Tighter hero/macro feel: `...Zeiss Master Primes 85mm lens at f/4...`

**Sharpness-intent tails by material:** `every diamond facet resolved, every prong visible` / `every muscle striation and fat vein resolved` / `the polished surface showing its mirror-like finish across the full circumference`.

**Lens choice ≈ intent:** 50mm = neutral, the scene as-is. 85mm = compression, hero isolation, tighter close-up. Don't switch lenses mid-series unless the shot genuinely calls for the longer compression.

---

## 4. FRAMING — spatial placement

In ISOLATE this collapses to one line: `centered in frame, entire object visible edge to edge, pure solid black background`.

In ASSEMBLE, promote to a labelled block. The label and "follow exactly" raise its parsing priority:

```
FRAMING — follow exactly:
[Camera position + angle]. The [hero] commands the center. [secondary objects each placed by relative position]. The [surface] reflects every object as dark mirrored doubles beneath them. [background] fills the back, falling into heavy darkness at the edges and top.
```

**Placement vocabulary:** `foreground left` / `background right` / `centered` / `draped loosely around the base of X` / `resting diagonally in the background` / `near the edge of the table` / `extending toward the left edge of frame`.

**Camera-position vocabulary:** `Camera at table height, slight downward angle looking across the surface` / `Camera low at table edge, looking across` / `Camera directly overhead, bird's-eye view looking straight down`.

**Reflection token (for polished surfaces):** `The polished surface reflects every object — [list] — as dark mirrored doubles beneath them.` This single sentence does enormous grounding work; reuse it whenever the surface is reflective.

**Full-bleed / crop control:** `Full-bleed frame, edge to edge` / `the marble fills every corner of the frame` / `the table edges completely cropped out` / `as if shooting on an infinite marble floor`. For top-down close-ups that must hide the table shape, the "infinite floor" phrasing is the move.

---

## 5. LIGHTING — behaviour, not mood

Describe the light's job: where it comes from, what it ignites, where it dies. Never just "dramatic" or "moody".

**The default luxury recipe (freeze across series):**
- *Darkness placement:* `Heavy darkness fills the upper frame and corners — the ceiling is a black void.`
- *Key:* `A focused warm key light from upper left rakes across the surface at a low angle, igniting [the marble's polish / the wet sheen on the meat / specular hits on the diamonds].`
- *Fill:* `Secondary soft light from upper right ensuring the far side reads clearly with clean highlights.`
- *Falloff:* `Strong falloff — the light dies before reaching the [curtains/background], which sit in deep rich shadow.`
- *Specular control:* `The light catches every diamond as sharp pinpoint specular hits. The knife blade reads as a thin bright edge.`

**For ISOLATE (softer, wrapping):** `Soft diffused key light from upper left wrapping the entire object, igniting specular hits. Secondary soft light from upper right so the far side reads with clean highlights. Faint contact shadow beneath grounding the piece against the black void.`

**For top-down REFRAME:** light direction must survive but shadows change — `Shadows now cast outward from each object across the surface as expected from a top-down light setup` / `A warm key light from the left adds directionality; the board casts a soft shadow to the right.`

**Verbs that do work:** *rakes across, ignites, wraps, carves (texture/shadows), catches, dies (falloff), grounds.* Avoid: *beautiful, dramatic, stunning, perfect.*

---

## 6. RENDER / MATERIAL — photo, not CGI

How each material behaves under the described light. The closing block; also where grain lives.

**Per-material recipes:**
- *Rose gold / metal:* `Rose gold deepens from bright copper-pink on lit edges to warm bronze in the recesses.` / `Metal deepens from bright polished highlights to rich warm tones in the recesses.`
- *Diamonds / gems:* `Diamonds read bright and alive with tiny refractions inside each stone.`
- *Wet raw meat:* `the raw surfaces glistening with a wet sheen`, `the fat soft and creamy against the bright red`.
- *Polished stone surface:* `the marble's polish igniting where the key rakes across, mirrored doubles in the dark surface`.

**Grain / finish line (freeze across series):** `Sharp, detailed film grain.` / `Sharp, detailed.` Keep it identical so the whole set shares one texture signature.

**The CGI-avoidance principle:** state cause→effect (the light rakes → the sheen ignites), give materials a *range* (lit edge → recess), and add grain. Renders look fake because they're uniform and clean; real photos have a tonal range and a texture floor.

---

## 7. Consistency token kit

Copy-paste recipes to freeze across a series. Change the hero SUBJECT and the FRAMING; keep everything below word-for-word.

**Camera token (cinematic luxury series):**
```
Cinematic film still shot on ARRI ALEXA Mini with Zeiss Master Primes 50mm lens at f/5.6 — razor sharp optics with extreme detail rendering, edge-to-edge crispness. Full frame edge to edge.
```

**Environment LOCK token (example — adapt the nouns once, then freeze):**
```
Recreate the exact environment from the reference image — same dark red marble round table with white and black veining, same deep red velvet curtains in the background, same lighting setup, same dark luxurious atmosphere, same reflections on the polished marble surface.
```

**Lighting token:**
```
Heavy darkness fills the upper frame and corners — the ceiling is a black void. A focused warm key light from upper left rakes across the table surface at a low angle, igniting the marble's polish and the wet sheen on the raw meat. The light catches every diamond on the ring and necklace as sharp pinpoint specular hits. The knife blade reads as a thin bright edge. Strong falloff — the light dies before reaching the curtains, which sit in deep rich shadow.
```

**Grain token:** `Sharp, detailed film grain.`

**Rule:** the moment any of these four gets re-worded between prompts, series coherence breaks. If you must change one (e.g. switch to 85mm for a tighter hero), change it in *all* the affected prompts and flag it in the `→` line.

---

## 8. Platform nuances

**Nano Banana Pro vs Nano Banana 2**
- *Pro:* superior multi-reference identity retention and legible text-in-image. Use for ASSEMBLE (multiple assets must stay themselves) and for any SUBJECT with typography that must read (a word on a ring, a label). Default for this skill.
- *2:* solid for single-object ISOLATE and simple REFRAME. Cheaper/faster; drops detail on dense multi-asset scenes and garbles small text more often.

**GPT Image**
- Strong instruction-following, good at REFRAME negations. Slightly more "rendered" look — lean harder on the RENDER block (grain, material range) to keep it photographic. Handles text reasonably.

**Flux**
- Best raw photographic texture; weaker at holding an exact reference identity across a compose. Good for ISOLATE and single-hero ASSEMBLE; less reliable when 3+ distinct assets must each stay faithful.

**Universal REFRAME caveat**
- Every model resists large angle jumps. Eye-level → top-down is the hardest; expect 2-3 attempts and load the negation list maximally. If a model keeps returning a three-quarter cheat, add `pure orthographic top view, the surface completely flat against the image plane, zero tilt` and re-state at the end.
