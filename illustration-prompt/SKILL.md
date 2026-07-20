---
name: illustration-prompt
description: Build advanced, production-ready prompts for AI illustration generation — for Midjourney, Nano Banana, GPT Image, Flux, or any image model where the goal is drawn, painted, vector, or otherwise non-photographic. Use this skill whenever the user asks for an illustration / drawing / vector / painted prompt, when they want to reverse-engineer an uploaded illustration, when they say "faz-me um prompt de ilustração / vector / desenho / cartoon / risograph / aguarela / pintura", when they paste a reference illustration to extract or replicate, or when they describe a non-photographic scene for AI generation. Trigger even without the word "prompt" — if they describe an illustration style and say "para gerar / para AI / para imagem", that counts. Do NOT use for photography (photo-prompt) or logo / brand mark generation (logo-prompt).
---

# illustration-prompt

Build advanced prompts for illustration-style AI image generation. The skill takes either a text brief or a reference image, decides what the user wants, asks at most one clarifying question, and returns a single production-ready prompt plus one improvement suggestion.

**Production-ready means:** the prompt is in the correct format for its destination model, uses 8 or more deliberately-chosen components from the framework, can be copy-pasted into the target tool with no editing, and produces a coherent image on the first generation in 80%+ of cases.

**Scope:** illustration covers anything that is *not* photographic — vector, flat design, hand-drawn, painted, watercolour, cel-shaded, risograph, isometric, pixel art, ink, marker, gouache, woodcut, collage, and so on. If the brief is photographic (real or fake), the user wants `photo-prompt` instead.

---

## When this skill runs

Two input modes, four decisions, one output.

**Input mode A — text brief.** User describes an illustration they want. Example: "preciso de um prompt para uma ilustração isométrica de uma cidade ao pôr do sol, estilo indie game".

**Input mode B — reference image.** User uploads one or more illustrations. The skill extracts the visual DNA from the reference and applies it to the brief.

---

## The four decisions, in order

### Decision 1 — Input mode

Look at the message. Image attached → mode B. No image → mode A. Both → treat the image as the anchor (mode B) and use the text as direction.

### Decision 2 — If mode B, replicate or inspire?

Determine intent silently. Only ask if genuinely ambiguous.

**Automatic decisions (do not ask):**

| Situation | Decision |
|---|---|
| Verb is explicit: "replicate", "extrai o prompt", "transforma isto em prompt", "reverse engineer", "copia este estilo", "que prompt faz esta imagem" | **Replicate** — describe the illustration faithfully, including the specific subject |
| Verb is explicit: "inspira-te", "no estilo de", "usa como referência", "extrai o estilo", "aplica este estilo a X" | **Inspire** — extract style DNA only, apply to a different subject |
| Image attached + text describes a **different subject** ("este estilo mas com uma raposa em vez de um cão") | **Inspire** — text overrides image subject |
| Image attached + text is empty or only says "prompt" / "para isto" | **Replicate** — no other instruction means "describe what's here" |

**Ask only when:** image attached + vague verb + no new subject described. The single clarifying question is: *"Replicar fielmente a ilustração ou extrair o estilo para outro assunto?"*

**Important for illustration:** "inspire" mode is the more common case here. Illustration reference images are usually shared to communicate **style**, not to be copied pixel-by-pixel. When in doubt between the two for illustration, lean inspire.

**Handling problematic references:** if the reference has visible AI artifacts (warped hands, garbled text, impossible geometry), describe what the image *is trying to be* — replicate the intent and aesthetic, not the technical flaws.

### Decision 3 — Destination model

This decides output format. Two formats, no exceptions.

| Destination | Format |
|---|---|
| Midjourney, SDXL, Stable Diffusion, Leonardo | **Comma-separated keywords**, in a code block. Each component < 9 words. |
| Nano Banana, Gemini Image, GPT Image, Flux, Imagen, Ideogram | **Cohesive prose**, in a code block. Full sentences. |

If the user names the model, use it. If they don't, ask: "Para que modelo? (Midjourney = vírgulas, Nano Banana / GPT Image / Flux / Gemini = prosa)". Don't guess.

### Decision 4 — Direction (only if materially ambiguous)

Ask only when ambiguity changes the prompt direction in a way you can't recover from. Examples of when to ask:

- Style genre is unstated and could go in incompatible directions (an "illustration of a fox" could be flat vector, watercolour, cel-shaded, woodcut, pixel art — these are not the same prompt)
- Era/medium reference is missing and the subject depends on it ("a sci-fi soldier" reads differently as 1980s cel anime vs 2020s flat vector)
- Conflicting style signals in the brief

**Do not ask** about: specific tool (pen tool vs blob brush), exact colour palette, line weight specifics, texture micro-decisions, background treatment. Decide these with judgement using `references/components.md`.

**Rule of thumb:** ask what changes the *direction*, decide everything that is *refinement*.

If you ask, ask **one** question. Bundle multiple aspects into a single message if needed, but never more than one round of clarification.

---

## Building the prompt

The illustration framework has 17 components, organised in three internal stages (this structure is for **your thinking**, not for the output — the output is plain prose or comma-separated keywords):

**Stage SIMULATE (how it's drawn):** Tool, Line Behavior, Form Construction, Physics of Style
**Stage RENDER (how it's lit and finished):** Surface, Lighting, Atmosphere & Depth, Effects & Glows, Imperfections
**Stage LOOK (how it reads):** Subject, Action / Pose, Scene Composition, Reduction Level, Mood, Style DNA, Colors, Background, Negative Prompt

Use `references/components.md` as the canonical vocabulary. It is **not** a checklist to fill — it is a vocabulary to choose from. Pick the components that matter for this specific brief. Omit what doesn't apply. Add components outside the framework when a specific brief calls for it.

Typical advanced prompt uses 10 to 16 components. Minimum useful is around 8. If you find yourself stretching to 20+, you're probably padding — cut.

### Physics of Style — what makes illustration prompts work

Illustration quality depends on capturing **how the medium behaves**, not just what tool was used. "Watercolour" alone is weak. "Watercolour with controlled bloom on the wet edges, hard transitions where the paper dried, slight bleed into the cotton fibre" is what a real watercolour looks like. The same applies to vector (Bezier curves vs imperfect hand-paths), marker (pressure variation, bleed-through, overlapping), pixel art (1px vs 2px outlines, dithering pattern, anti-alias on / off).

When you specify the tool, **always describe how the tool behaves** in 1-2 phrases. This is the single highest-leverage move for illustration prompts.

### Order matters differently for each format

**Anchor against photographic default — non-negotiable.** AI image models default toward photorealism. Every illustration prompt must begin by explicitly asserting the medium: "A vector illustration of...", "A watercolour painting of...", "An ink drawing of...", "A risograph print depicting...". This anchor goes **first**, before any other component, in both prose and Midjourney formats. Without it, the model can drift toward photographic interpretation of details that should be illustrated.

**For prose models (Nano Banana et al.):** order components by **narrative weight** within the three stages. Lead with the medium anchor and Style DNA headline (one phrase that captures the whole genre — "A flat geometric vector illustration with grain depicting...", "A watercolour editorial illustration of..."), then describe what's in the image (subject, action, composition, reduction level, mood), then describe how it's drawn (tool, line, form, physics), then how it's rendered (surface, lighting, imperfections), then close with colour and background.

**Prose length scales with scene density.** A simple character study fits one paragraph. A dense illustrated scene with multiple subjects, environment layers, and effects legitimately spans 2 to 4 paragraphs. Do not strangle the description to fit a single block. Equally, do not pad to look thorough.

**For Midjourney:** order components by **importance signal**. Earliest tokens carry more weight. Lead with the medium anchor + Style DNA (e.g., "vector illustration, flat geometric vector with grain"), then subject + action, then tool + line behavior, then surface + lighting, then colors. **The negative prompt in Midjourney is the `--no` parameter at the very end of the prompt, with terms separated by commas — never inline `no X, no Y` clauses.** Example ending: `... vivid red sneakers, mustard yellow jersey --no photorealism, 3D render, realistic anatomy, soft gradients, detailed faces, fine line art`. Do not prefix each term with `no`; the `--no` parameter applies to the whole list. Do not append any other parameters (`--ar`, `--s`, `--c`, etc.) or aspect ratios — leave those choices to the user.

### Aesthetic presets

If the user signals an aesthetic ("flat vector", "watercolour", "risograph", "cel-shaded anime", "isometric", "indie game"), consult `references/presets.md` to pull the established DNA for that style. Presets are not rigid templates — they're starting points you adapt to the specific brief.

When the brief combines two presets ("watercolour mas com linha de marker grosso"), pick one as dominant and inject 1-2 elements from the secondary. See the "Como usar os presets" section in `presets.md` for the merge rules.

### Imperfection layers

Four independent imperfection layers (full detail in `components.md`). Activate the ones that fit the style.

1. **Hand-drawn imperfections (linha humana)** — overshoot, pressure variation, sketch lines, unclosed strokes
2. **Print & registration artifacts** — risograph misregistration, halftone, ink bleed, plate gap
3. **Paper & surface texture** — paper grain, watercolour bloom, ink absorption, deckled edges
4. **Digital "errors" intentional** — chromatic aberration, glitch displacement, scan lines, dithering

**Default: all four OFF.** Activate only the layers that fit the brief. A flat geometric vector with mild grain uses **Layer 3 only, light**. A risograph genuine uses **1 + 2 + 3**. A hand-drawn editorial uses **1 + 3**. A cyberpunk glitch uses **4 alone**.

**Dosage matters.** Each layer has internal dosage rules in `components.md`. Respect them. Stacking everything within a layer turns the illustration into a parody of its own style.

**Negative Prompt (the AVOID list)** is its own component, not an imperfection layer. Almost every illustration prompt benefits from a `negative prompt` / `AVOID` clause that excludes the wrong style register (e.g., "no photorealism, no 3D render, no realistic shading" on a flat vector prompt).

### Mode B specifics — image → prompt

**If replicating:** describe what you see in detail, mapping observations to the component framework. Don't invent details that aren't there. The Style DNA should be your first observation — pin down the three-word genre summary before describing anything else. Then move through SIMULATE → RENDER → LOOK.

**If inspiring:** extract only the **style DNA** — Tool, Line Behavior, Form Construction, Physics of Style, Surface, Lighting style, Colour palette, Imperfection layers active. **Drop** the original subject, action, composition. Apply the extracted DNA to whatever new subject the user named. The new prompt should make a person look at it and feel the same visual register, even though the content is different.

**Multiple images in mode B:** treat each separately. Output one prompt per image, separated by `---` on its own line, each in its own code block.

### Special case — integrated text

When the brief includes a poster, magazine cover, zine, book cover, or any illustration with **text inside the image** (title, headline, captions, hand-lettered phrases), state the text explicitly between **double quotes** in the prompt, and add a clear instruction about typography style.

AI image models struggle with text — even when they get the letters right, the typography is often generic. Always specify:
1. The exact text in quotes: `"ALMOST A HERO"`, `"Don't be afraid"`, `"Issue 03 / Spring"`
2. Typography character: `bold geometric sans-serif`, `hand-lettered brush script`, `condensed slab serif`, `1970s display serif`, `decorative hand-drawn caps`
3. Placement: `title at the top arched over the figure`, `headline running vertically on the right edge`, `caption in the lower-left corner`

If the user doesn't specify the text, ask **once**: "Que texto deve aparecer na imagem, e em que estilo de tipografia?" Don't generate placeholder Lorem Ipsum or invented headlines.

---

## Output format

Always exactly this shape, nothing more:

1. **One code block** containing the prompt.
2. **One line below** with a suggestion for improvement or continuation. Prefix it with "→ ". Examples:
   - `→ Para uma versão mais grungy, troca o grão limpo por halftone dots medianos.`
   - `→ Posso converter este mesmo prompt para Midjourney em vírgulas, se preferires.`
   - `→ Para reforçar o registo indie game, adiciona "subtle inner glow on key shapes".`

No preamble ("aqui está", "fiz o teu prompt"). No closing line ("espero que ajude"). No explanation of the components used. The prompt and the one-line suggestion. That's it.

The prompt itself is always in **English**. The clarifying question (if any) and the suggestion line are in **European Portuguese**.

### Example — mode A, Nano Banana destination

User: "prompt nano banana de uma ilustração isométrica de uma cafetaria à chuva, estilo indie game"

Output:

```
A flat geometric isometric illustration of a small corner café at night in the rain. Style DNA: lineless indie game vector with subtle grain. The café sits in the centre-left of the frame, its warm yellow windows glowing against the cool blue night, a striped awning over the entrance, a couple of small round tables visible inside with tiny silhouetted figures. Wet cobblestone street stretches diagonally in front, reflecting the window light in soft warm streaks. Rain falls as fine diagonal vector strokes across the whole scene, slightly desaturated. Strictly lineless — all shapes defined by flat color fills with clean Bezier edges, no black outlines. Forms are simplified geometric blocks: cube-based café, cylindrical lampposts, rectangular windows with rounded corners. Light is flat with two-tone cel-shading on the larger surfaces, no gradients. Fine noise grain overlay across the entire image gives it a printed retro feel. Colour palette is moody and cool: deep navy blues, slate greys, with warm yellow and amber as the only sources of warmth from the windows and a single streetlamp. Multi-layered parallax depth: foreground rain, mid-ground café and street, distant silhouetted rooftops in darker blue. No photorealism, no 3D render, no detailed textures, no realistic shading, no gradients beyond the cel-shading, no line art.
```
→ Para empurrar mais o registo indie game, posso adicionar um subtle glow halo à volta das janelas amarelas e pequenas wisps de fumo da chaminé.

### Example — mode A, Midjourney destination

User: "prompt midjourney de um retrato editorial em aguarela de um músico de jazz idoso"

Output:

```
watercolour editorial illustration, elderly jazz musician portrait, close-up three-quarter view, eyes closed mid-performance, saxophone catching warm light, loose expressive brushwork, controlled watercolour bloom on the cheeks and jacket, hard pigment edges where paper dried, soft wash background fading to cream, cold-press cotton paper grain visible throughout, ink line accents on the saxophone bell and lapel, muted earth palette of burnt sienna, indigo, and warm ochre, single warm light source from upper-left casting soft shadow on the right of the face, deckled paper edges suggested, slight bleed into the fibre --no photorealism, digital flatness, 3D, vector outlines
```
→ Para uma variação mais íntima, fecha o plano em close-up só dos olhos fechados e mantém o saxofone fora de campo.

### Example — mode B, replicate, multiple images

[For each image, one code block, separated by `---` on its own line, followed by one shared suggestion line at the end.]

---

## Anti-patterns

Things this skill does **not** do:

- Greet the user or introduce itself.
- Explain which components it chose or why.
- Output the internal SIMULATE / RENDER / LOOK structure as section headers — that structure is for *thinking*, not for the output.
- Skip the medium anchor at the start of the prompt ("A vector illustration of...", "A watercolour painting of..."). Every illustration prompt must explicitly assert the medium first, to prevent drift toward photographic interpretation.
- Skip the `Physics of Style` description when a tool is specified ("watercolour" alone is too weak; describe how it behaves).
- Skip the negative prompt / AVOID clause — almost every illustration benefits from excluding the wrong register explicitly.
- Generate placeholder Lorem Ipsum or invented text when the brief involves integrated text (posters, covers, zines). Ask once for the exact text, or use the text the user provided in quotes.
- Replicate AI artifacts or technical defects in a reference image as if they were intentional style.
- Include real illustrator names, real studio names, real character IPs, or branded styles inside the output prompt. Author names can be used as triggers to detect a preset, but the descriptive equivalent goes into the prompt itself.
- Offer JSON format as a fallback.
- Ask more than one round of clarifying questions.
- Fill every component in the framework when fewer would do the job.
- Output the prompt without a code block.
- Mix formats (prose with commas, or commas with full sentences).
- Add Midjourney parameters (`--ar`, `--s`, `--c`, `--style`, etc.) or aspect ratio tokens.
- Generate prompts depicting minors in adult, sexualised, or otherwise inappropriate contexts.

---

## When in doubt

- Faltar informação que decide a direcção? **Pergunta uma vez.**
- Faltar informação que decide o refinamento? **Decide com critério, usa `references/components.md`.**
- Imagem ambígua entre replicate / inspire? **Pergunta — mas em ilustração assume inspire se não for óbvio.**
- Modelo de destino não dito? **Pergunta.**
- Estilo não dito mas pedido vago? **Assume "Flat geometric vector with grain" como default.** É o registo contemporâneo mais consistente e o que cai melhor numa maioria de briefs vagos.

## Reference files

- `references/components.md` — the component vocabulary (tool, line, surface, lighting, colour, etc.) with curated examples and the four imperfection layers
- `references/presets.md` — established aesthetic DNAs (flat geometric vector, lineless indie game, watercolour editorial, risograph, cel-shaded anime, isometric, hand-drawn rough, etc.)
- `references/examples.md` — full before/after worked examples for both formats and both modes
