---
name: nano-edit
description: Build production-ready prompts for AI image EDITING and SCENE COMPOSITION — isolating an object onto a clean/black background, assembling multiple objects into one styled scene, or re-framing an existing image to a new camera angle. For Nano Banana Pro / 2, Gemini Image, GPT Image, Flux, any edit-capable model. Use whenever the user wants to clean/isolate a product, combine product or reference images into one environment, change a photo's camera angle (top-down, eye-level, three-quarter), build a coherent product-photo series, or says "isola este objeto", "limpa o fundo", "junta estes numa cena", "monta uma cena", "muda o ângulo", "visto de cima / top-down / flat lay", "outra perspetiva", "mantém a cena e muda só a câmara". Trigger even without the word "prompt" if the goal is to edit, isolate, compose, or re-angle an image for AI generation. Do NOT use for generating a brand-new photo from a text brief with no edit/compose intent (photo-prompt), illustration (illustration-prompt), or logos (logo-prompt).
---

# nano-edit

Build advanced prompts for AI image **editing and composition** — the three operations that produce a coherent product/scene series: isolating assets, assembling them into a scene, and re-angling an existing frame. Takes a brief and/or reference images, picks the operation, asks at most one clarifying question, returns a single copy-paste prompt plus one improvement line.

**Production-ready means:** correct format for the destination model, every block the operation needs and nothing it doesn't, copy-pasteable with no editing, and — critically for a series — consistency tokens carried verbatim across related prompts so the outputs read as one shoot.

This skill is the editing/composition counterpart to `photo-prompt`. If the task is "describe a new photo from scratch", that's `photo-prompt`. If the task is "do something *to* or *with* existing images", it's this one.

---

## The one idea that makes the system work

Every prompt is **six blocks** in a fixed order, run in **one of three modes**. The blocks are a vocabulary, not a checklist — each mode activates a different subset with different emphasis. Get the mode right, pull the right blocks, and carry the consistency tokens across the series. That's the whole system.

### The six blocks (fixed order)

1. **LOCK** — the consistency anchor. Tells the model the reference is *truth*, not inspiration. Phrased as "Recreate the exact X from the reference — same A, same B, same C." Each "same" pins one axis (form, material, proportion, layout, placement). Repetition is deliberate.
2. **SUBJECT** — dense physical description of the hero(s). Texture, not adjectives. The more real physical detail, the less the model invents.
3. **CAMERA / OPTICS** — body + lens + aperture + sharpness intent. *This is the consistency token that makes a series cohere.* Same camera/lens across shots = "shot the same day", not "ten stock images".
4. **FRAMING** — spatial placement. In multi-object scenes, promote to a labelled `FRAMING — follow exactly:` block, placing each object by relative position.
5. **LIGHTING** — describe light *behaviour* (key, fill, falloff, contact shadow), never a vague mood. Behaviour = control.
6. **RENDER / MATERIAL** — how materials react to light + grain/texture. The block that separates "photo" from "CGI render".

Full vocabulary, phrasings, and recipes for each block: `references/blocks.md`.

---

## Decision 1 — Which mode?

Read the message + attachments. Pick exactly one mode.

| Signal | Mode |
|---|---|
| One object/subject, wants it clean on plain/black background, as a reusable asset. "isola", "limpa o fundo", "recorta", "põe em fundo preto", "preciso disto limpo para referência" | **ISOLATE** |
| Two or more objects/assets to be combined into one environment or scene. "junta", "monta uma cena", "combina estes", "põe tudo numa mesa", "compõe com estes objetos" | **ASSEMBLE** |
| One existing image, wants the *same scene* from a different camera angle or framing. "muda o ângulo", "visto de cima", "top-down", "flat lay", "de frente", "outra perspetiva", "mantém tudo e muda só a câmara" | **REFRAME** |

**Ambiguity rule:** only one case needs a question — a single image with a verb that could be either "clean it up" or "re-angle it" ("trata-me esta imagem"). Ask once: *"Queres isolar o objeto em fundo limpo, ou manter a cena e mudar o ângulo da câmara?"* Everything else, decide silently.

The three modes are not interchangeable. ISOLATE and ASSEMBLE are **generative** (they build) — the language is "recreate", "product photograph of". REFRAME is **restrictive** (it preserves) — the language is "change ONLY", "keep every". Using generative language in a reframe makes the model re-render the scene from scratch and lose the assets. This is the single most common failure.

---

## Decision 2 — Destination model

Decides format and a few capability notes.

| Destination | Format |
|---|---|
| Nano Banana Pro / 2, Gemini Image, GPT Image, Flux, Imagen, Ideogram | **Cohesive prose**, in a code block. Full sentences. |
| Midjourney, SDXL, others | This skill targets edit-capable models. Midjourney has no true edit/compose mode — if the user names it, flag it: *"Para edição/composição com referência o Midjourney não serve bem; queres que adapte para Nano Banana ou GPT Image?"* |

Default assumption when unstated: **Nano Banana Pro** (best current edit + reference fidelity). State the assumption in the suggestion line rather than asking, unless the user signals another model.

**Capability notes** (see `references/blocks.md` → "Platform nuances"):
- **Nano Banana Pro vs 2:** Pro holds multi-reference identity and text-in-image (e.g. a word on a product) far better — prefer Pro for ASSEMBLE and for any SUBJECT with legible typography. 2 is fine for single-object ISOLATE.
- **REFRAME reliability:** all models resist large angle changes. The negative-space block (below) is what forces it. Top-down from an eye-level original is the hardest ask — warn that it may take 2-3 generations.

---

## Building the prompt — by mode

Pull only the blocks the mode needs. Skeletons below; expand each block using `references/blocks.md`.

### Mode ISOLATE — clean asset on plain background

Goal: a reusable reference asset, not a finished scene. Aperture **closed (f/8–f/11)** so the whole object is sharp for reuse. Background almost always pure solid black or seamless plain.

Blocks: **LOCK → SUBJECT → CAMERA(closed) → LIGHTING(wrap + contact shadow) → RENDER**. (FRAMING reduces to "centered in frame, entire object visible, [background].")

```
Recreate the exact [object] from the reference image — same design, same materials, same proportions, same [key feature] placement. [orientation/pose].
Product photograph of the same [object] from the reference image. [dense SUBJECT description — every feature that must survive]. [full extent instruction: entire object from edge to edge, all relevant faces visible]. Centered in frame, pure solid black background.
Shot with 50mm lens at f/8 — the entire [object] uniformly sharp, every surface in focus from front to back. [material-specific sharpness: every facet / weave / grain resolved].
Soft diffused key light from upper left wrapping the entire [object], [specular behaviour]. Secondary soft light from upper right ensuring the far side reads clearly with clean highlights. Faint contact shadow beneath grounding the piece against the black void.
[RENDER: how the material shifts from lit edges to recesses; how reflective/refractive parts read].
```

### Mode ASSEMBLE — multiple assets into one scene

Goal: a styled environment holding several isolated assets coherently. **LOCK doubles** — one lock for the environment, one per critical asset ("Use the exact same X from the reference"). Aperture opens (**f/4–f/5.6**) to separate foreground/background. The labelled FRAMING block is mandatory.

Blocks: **LOCK(environment) + LOCK(each asset) → CAMERA → SUBJECT(hero) → FRAMING(labelled) → LIGHTING → RENDER/grain**.

```
Recreate the exact environment from the reference image — [dense environment description: surface, background, atmosphere, reflections]. Use the exact same [asset A] from the [A] reference — [what must match]. [repeat per asset].
[Camera line: body + lens + aperture + sharpness intent. Carry verbatim across the series.]
A [genre] photograph. [Dense SUBJECT description of the hero element — texture first].
FRAMING — follow exactly:
[Camera position + angle]. The [hero] commands the center. [Each secondary object placed by relative position: foreground left, background right, draped around X]. The [surface] reflects every object as [reflection behaviour]. [Background] fills the back, falling into [darkness/falloff].
LIGHTING:
[Where darkness sits]. [Key light: direction, angle, what it ignites]. [Fill: what it rescues]. [Specular behaviour on each material]. [Falloff: where the light dies].
[Grain/texture line].
```

### Mode REFRAME — same scene, new angle (edit an existing image)

Goal: change *only* the camera, keep everything else. This is the restrictive mode — the structure differs from the other two.

Blocks: **SCOPE LOCK → ANGLE SPEC (with negations) → FRAMING → CONTENT PRESERVATION → RECONSTRUCTION LICENSE → STYLE LOCK → RESTATEMENT**.

```
Edit the provided image — change ONLY the camera angle and framing. Recreate this exact same scene shot from [target angle — be literal: "a strict perpendicular top-down view at exactly 90 degrees, camera directly above looking straight down"]. [NEGATIONS — define the angle by what it forbids: NO front face visible, NO side visible, NO three-quarter angle, NO perspective distortion, NO vanishing point — pure orthographic top view].
[FRAMING: tight close-up / wide / etc. Every key element included and sharing the frame; no single object dominating alone. Surface visible only as needed to ground the composition.]
Keep every subject, object, prop, material and element from the original image present in the new view. Reposition them naturally as they would rest on the surface when seen from [angle].
Reconstruct the [tops/backs/sides now visible] of each object and the surface details around them using the materials, colors, textures and details already established in the original image — extending them logically.
Keep the same lighting source direction, same light quality, same color temperature, same color palette, same mood, same atmosphere, same film look, same texture, same grain, same resolution, same image quality, same photographic style, same depth-of-field feel. Shadows now cast [new direction expected from the angle].
The final image must read as the exact same scene captured from [restate the angle and framing] — only the angle and framing change.
```

**Why the negations carry the weight:** in REFRAME the model's default is to keep the *original* angle and nudge slightly. Telling it what to *show* is weaker than telling it what to *forbid*. Load the negation list. For top-down specifically: forbid every non-orthographic cue explicitly (front face, side, three-quarter, vanishing point).

---

## Consistency tokens — the series glue

The reason a set of these prompts reads as one professional shoot, not a pile of unrelated images: **identical tokens carried verbatim across every prompt in the series.**

When the user is building a series (or will be — most product work is), lock and reuse, word-for-word:
- **Camera + lens + aperture** line (e.g. "ARRI ALEXA Mini with Zeiss Master Primes 50mm lens at f/5.6").
- **Lighting recipe** (key from upper left, fill from upper right, strong falloff, contact shadow).
- **Environment LOCK** phrasing (the marble/curtains/atmosphere sentence, identical each time).
- **Asset LOCK** phrasing ("the same X from the reference" — same words for asset X everywhere it appears).
- **Grain/finish** line.

What changes between prompts: the hero SUBJECT, the FRAMING block, and the mode. Everything in the bullets above stays frozen. When you hand back a prompt that belongs to a series, note in the suggestion line which tokens to keep frozen for the next shot.

Full reusable token recipes: `references/blocks.md` → "Consistency token kit".

---

## Output format

Always exactly this shape:

1. **One code block** containing the prompt (prose, English).
2. **One line below**, prefixed `→ `, in European Portuguese — an improvement, the model assumption if you made one, or which tokens to freeze for the next shot in the series.

No preamble, no "aqui está", no explaining the blocks, no closing line. The prompt and the one line. That's it.

The prompt is always **English**. The clarifying question (if any) and the `→` line are **European Portuguese**.

**Multiple images / multiple shots requested:** one code block per output, separated by `---` on its own line, then one shared `→` line at the end noting the frozen tokens.

Worked examples for all three modes: `references/examples.md`.

---

## Anti-patterns

This skill does **not**:

- Greet, introduce itself, or explain which blocks it used.
- Mix generative language ("recreate", "product photograph of") into a REFRAME — that re-renders the scene and loses the assets.
- Drop the negation block in a REFRAME — without it the angle barely moves.
- Open the aperture in ISOLATE — assets must be edge-to-edge sharp for reuse.
- Forget to double the LOCK in ASSEMBLE (environment lock AND per-asset lock).
- Let consistency tokens drift between prompts in a series (re-wording the camera line each time is the #1 way to break series coherence).
- Add Midjourney parameters or aspect-ratio tokens — leave those to the user.
- Invent SUBJECT details not present in the reference when the mode is ISOLATE or REFRAME (those are faithful modes).
- Output without a code block, or output JSON.

---

## When in doubt

- Single image, verb ambiguous between clean-up and re-angle? **Ask once** (the Decision 1 question).
- Destination model unstated? **Assume Nano Banana Pro**, note it in the `→` line, don't ask.
- Angle target vague in a REFRAME ("outro ângulo")? **Ask once** which angle — top-down, eye-level, three-quarter, low — it changes everything.
- Is this a series? **Assume yes** if there's already an environment + assets in play, and freeze the consistency tokens by default.
- How dense should SUBJECT be? **Match the mode** — faithful modes (ISOLATE/REFRAME) describe only what's there; ASSEMBLE's hero can be described richly.

## Reference files

- `references/blocks.md` — the six-block vocabulary in full (LOCK phrasings, camera/optic tokens, lighting recipes, render-physics language), the **Consistency token kit**, and **Platform nuances** (Nano Banana Pro vs 2, GPT Image, Flux).
- `references/examples.md` — full worked examples for ISOLATE, ASSEMBLE, and REFRAME, built from real product-shoot prompts, with the before/after reasoning.
