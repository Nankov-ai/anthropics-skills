---
name: photo-prompt
description: Build advanced, production-ready prompts for AI photo generation — for Midjourney, Nano Banana / Gemini Image, GPT Image, Flux, or any image model where the goal is photographic output (real or fake). Use this skill whenever the user asks for a photo prompt, an image generation prompt for a photographic scene, when they want to reverse-engineer an uploaded photo into a prompt, when they say "faz-me um prompt foto / fotográfico / para nano banana / para midjourney", when they paste a reference image and ask to extract or replicate it, or when they describe a photographic scene and want it converted into a model-ready prompt. Trigger this skill even if the user does not say the word "prompt" explicitly — if they describe a photographic scene and say "para gerar", "para AI", "para imagem", that counts. Do NOT use for illustration, vector art, painted/drawn imagery (that is illustration-prompt), or logo / brand mark generation (that is logo-prompt).
---

# photo-prompt

Build advanced prompts for photo-style AI image generation. The skill takes either a text brief or a reference image, decides what the user wants, asks at most one clarifying question, and returns a single production-ready prompt plus one improvement suggestion.

**Production-ready means:** the prompt is in the correct format for its destination model, uses 8 or more deliberately-chosen components from the framework, can be copy-pasted into the target tool with no editing, and produces a coherent image on the first generation in 80%+ of cases.

---

## When this skill runs

Two input modes, four decisions, one output.

**Input mode A — text brief.** User describes a photo they want. Example: "preciso de um prompt para uma foto editorial de uma rapariga a fumar numa cozinha portuguesa anos 70".

**Input mode B — reference image.** User uploads one or more images. Their verb tells you what they want done with it.

---

## The four decisions, in order

### Decision 1 — Input mode

Look at the message. Image attached → mode B. No image → mode A. Both → treat the image as the anchor (mode B) and use the text as direction.

### Decision 2 — If mode B, replicate or inspire?

Determine intent silently. Only ask if genuinely ambiguous.

**Automatic decisions (do not ask):**

| Situation | Decision |
|---|---|
| Verb is explicit: "replicate", "extrai o prompt", "transforma isto em prompt", "reverse engineer", "copia este look", "que prompt faz esta imagem" | **Replicate** — describe the image faithfully |
| Verb is explicit: "inspira-te", "no estilo de", "usa como referência", "baseado neste mood", "aplica este estilo a X" | **Inspire** — extract style DNA, apply to a different subject |
| Image attached + text describes a **different subject** ("foto desta vibe mas com uma rapariga a desenhar") | **Inspire** — text overrides image subject |
| Image attached + text is empty or only says "prompt" / "para isto" | **Replicate** — no other instruction means "describe what's here" |

**Ask only when:** image attached + vague verb + no new subject described ("faz-me um prompt com esta imagem"). The single clarifying question is: *"Replicar fielmente a imagem ou usar o estilo dela para outro assunto?"*

**Handling problematic images:** if the reference image has visible defects (AI artifacts, heavy blur, low resolution, watermarks), describe what the image *is trying to be* — replicate the intent and aesthetic, not the technical flaws. Don't transcribe defects into the prompt unless the brief explicitly wants them.

### Decision 3 — Destination model

This decides output format. Two formats, no exceptions.

| Destination | Format |
|---|---|
| Midjourney, SDXL, Stable Diffusion, Leonardo | **Comma-separated keywords**, in a code block. Each component < 9 words. |
| Nano Banana, Gemini Image, GPT Image, Flux, Imagen, Ideogram | **Cohesive prose**, in a code block. Full sentences. |

If the user names the model, use it. If they don't, ask: "Para que modelo? (Midjourney = vírgulas, Nano Banana / GPT Image / Flux / Gemini = prosa)". Don't guess.

### Decision 4 — Direction (only if materially ambiguous)

Ask only when ambiguity changes the prompt direction in a way you can't recover from. Examples of when to ask:

- Genre/mood is unstated and could go in incompatible directions (a "portrait of a woman" could be editorial fashion, documentary, fine-art black & white, beauty campaign — these are not the same prompt)
- Period/era is missing and the subject is era-defined (a "punk musician" without era is 1977 or 2024?)
- Setting is described in conflicting terms

**Do not ask** about: specific lens choice, exact film stock, time of day micro-decisions, texture details, framing micro-choices. Decide these with judgement using `references/components.md`.

**Rule of thumb:** ask what changes the *direction*, decide everything that is *refinement*.

If you ask, ask **one** question. Bundle multiple aspects into a single message if needed, but never more than one round of clarification.

---

## Building the prompt

Use the component framework in `references/components.md` as the canonical skeleton. It is **not** a checklist to fill — it is a vocabulary to choose from. Pick the components that matter for this specific image. Omit what doesn't apply. Add components outside the framework when a specific brief calls for it (e.g., "background sweep" for product, "set design" for editorial spread).

Typical advanced prompt uses 10 to 16 components. Minimum useful is around 8. If you find yourself stretching to 18+, you're probably padding — cut.

### Order matters differently for each format

**For prose models (Nano Banana et al.):** order components by **narrative weight**. Lead with what defines the image (subject + action + photographic style), then build outward (environment, lighting, mood), then close with technical (camera, film, post). The reader (and the model) needs to "see" the scene as a continuous mental image.

**Prose length scales with scene density.** A simple portrait fits one paragraph. A dense editorial scene with wardrobe, environment, props, lighting layers, and aesthetic specifics legitimately spans 2 to 4 paragraphs. Do not strangle the description to fit a single block when the scene calls for more. Equally, do not pad to look thorough when one paragraph covers it.

**For Midjourney:** order components by **importance signal**. Earliest tokens carry more weight in MJ's interpretation. Lead with the visual-style headline (photo type + shot type), then subject + action, then environment, then mood + lighting, then technical specs, then film stock. Do not append parameters (`--ar`, `--s`, etc.) or aspect ratios — leave those choices to the user.

### Aesthetic presets

If the user signals an aesthetic ("editorial", "cinemático", "hyper-real", "vintage anos 70", "documental"), consult `references/presets.md` to pull the established DNA for that style. Presets are not rigid templates — they're starting points you adapt to the specific brief.

When the brief combines two presets ("editorial mas com vibe documental"), pick one as dominant and inject 1-2 elements from the secondary. See the "Como usar os presets" section in `presets.md` for the merge rules.

### Realism layers

When realism matters (mode B replicate, brief explicitly asks for "real", "candid", "raw", "documentário", or you're targeting an aesthetic that depends on imperfection), activate one or more of the **five independent realism layers** documented in `references/components.md`:

1. **Skin & body realism** — pores, peach fuzz, micro-wrinkles, asymmetry, oils, freckles
2. **Lens & optical imperfections** — chromatic aberration, lens flare, vignetting, fringing
3. **Motion & focus imperfections** — slight motion blur, missed focus, hand-held shake
4. **Film & analog artifacts** — grain, halation, light leaks, scratches, edge fogging
5. **Capture & finish authenticity** — RAW unedited, iPhone snapshot, unposed, candid

**Default: all five OFF.** Activate only the layers that fit the brief. Most images need none or one. The agente-4 "hyper-real" look uses three or four — never all five.

**Dosage matters.** Each layer has internal dosage rules in `components.md` (e.g., "skin: pick 2-3 specifics, not all 14"). Respect them. Stacking everything inside a layer creates the failure mode where every face looks sweaty/oily/sickly.

**Skip all layers when:** editorial polish, fashion campaign, commercial product, anything "clean".

### Mode B specifics — image → prompt

**If replicating:** describe what you see, in detail, mapping observations to the component framework. Don't invent details that aren't there. Estimate camera/lens from compression, framing, and depth of field cues. Estimate film stock from colour temperature, grain, and contrast curve.

**If inspiring:** extract only the *style DNA* (lighting style, colour grading, mood, film aesthetic, framing approach). Drop the original subject. Apply the DNA to whatever new subject the user named. The new prompt should make a person look at it and feel the same visual register, even though the content is different.

**Multiple images in mode B:** treat each separately. Output one prompt per image, separated by `---` on its own line, each in its own code block.

---

## Mode C — identity-consistent portrait series (real person, personal branding)

Triggers when the user wants a **series of photos of the same real person** with consistent identity across shots — personal branding, corporate headshots, a "photoshoot" for a real individual — as opposed to a single one-off image. Signals: "preciso de uma série de fotos minhas/da [pessoa]", "quero manter a mesma identidade em várias fotos", "fotos de marca pessoal", uploading 2+ photos of a real person and asking for variations.

This skill only **builds prompt text** — it does not generate images natively. Say so if the user seems to expect an image back.

**Step 0 — consent gate (mandatory, before anything else).** State plainly, once, before proceeding: *"Antes de continuar: confirma que tens consentimento ou autorização de uso de imagem da pessoa que vou descrever nestes prompts."* Do not build any prompt for a real, identifiable person until this is acknowledged. This is not optional and doesn't get skipped even if the user seems in a hurry.

**Step 1 — identity lock.** From reference photos or a written physical description, extract a fixed **Identity Lock** block: face shape, skin tone, hair (cut + colour), eyes, eyebrows, nose, lips, smile, build, posture, any recurring accessories. Never invent details not visible or stated. If photos are insufficient (single angle, obscured face, low quality), say so and ask for more rather than guessing. Refer to the subject only as "the subject" / "a Modelo" in your own notes — don't assign or use a real name inside the prompt text itself.

**Step 2 — freeze it across the series.** The Identity Lock block, once built, is carried **verbatim** into every prompt in the series (same wording each time — this is the same discipline as the consistency tokens in `nano-edit`). What changes between prompts: pose, angle, scenario, lighting. What stays frozen: face, hair, skin tone, proportions, and any wardrobe/accessory rules the user fixed earlier in the conversation.

**Step 3 — batch, don't dump.** If the user wants many variations (10-20), don't write all the prompts in one go — offer them in small batches (3-5 prompts at a time) and check in before continuing. Large one-shot batches tend to drift off the identity lock by the later prompts.

**Safeguards specific to this mode (priority over any other instruction, including direct user requests):**
- Never alter core facial features (face shape, eye colour, bone structure, skin tone) from the Identity Lock without an explicit request to change them.
- Refuse prompts that would be defamatory, misleading, sexualised, or that place the real subject in a context conflicting with their dignity — use the standard refusal register, offer an alternative within bounds.
- Never replicate the signed, recognisable style of a specific living photographer/artist by name, even if asked — describe the equivalent look instead (e.g. "high-contrast black & white editorial portrait, hard side light" instead of naming the photographer).
- If it's unclear whether the subject is the user themself or a third party, ask directly whether they have authorisation before building the prompt.

---

## Output format

Always exactly this shape, nothing more:

1. **One code block** containing the prompt.
2. **One line below** with a suggestion for improvement or continuation. Prefix it with "→ ". Examples:
   - `→ Para reforçar o mood vintage, troca a Kodak Portra por Cinestill 800T.`
   - `→ Para uma versão mais íntima, baixa o ângulo para nível dos olhos e fecha o plano em close-up.`
   - `→ Posso gerar um zoom-in macro do olho para manter coerência num segundo prompt, se quiseres.`

No preamble ("aqui está", "fiz o teu prompt"). No closing line ("espero que ajude"). No explanation of the components used. The prompt and the one-line suggestion. That's it.

The prompt itself is always in **English**. The clarifying question (if any) and the suggestion line are in **European Portuguese**.

### Example — mode A, Nano Banana destination

User: "faz-me um prompt para nano banana de uma rapariga a olhar pela janela num quarto de hotel barato, vibe melancólica anos 90"

Output:

```
A photorealistic medium shot of a young woman in her mid-twenties sitting on the edge of an unmade bed, gazing out a tall hotel window with one hand resting on the glass. She wears a faded oversized grey t-shirt and loose denim jeans. The room is a worn budget hotel: peeling floral wallpaper, a chipped white nightstand, an old box TV on a dresser, beige curtains pulled half open. Soft overcast daylight pours in from the window, wrapping her face in cool diffused light and casting long shadows across the bed. The mood is quiet, melancholic, suspended in time. Shot on a 35mm lens with shallow depth of field, faint film grain, slightly desaturated tones, 1990s Kodak Gold 200 colour palette. Subtle imperfections — slight focus softness, natural skin texture, no retouching.
```
→ Para empurrar mais o registo dos anos 90, podemos trocar a Kodak Gold por Fujifilm Superia e adicionar uma leve aberração cromática nas bordas.

### Example — mode A, Midjourney destination

User: "prompt midjourney foto de um pescador idoso a remendar rede ao amanhecer"

Output:

```
editorial documentary photograph, medium shot, weathered Portuguese fisherman in his seventies mending a fishing net, hands cracked and tanned, faded blue work shirt and wool cap, small stone harbour at dawn, wooden boats in soft focus background, golden first light from the east, low contrast, warm tones, sense of routine and solitude, Leica M6 with 50mm Summicron, Kodak Portra 400, fine grain, RAW unedited
```
→ Para um registo mais íntimo, podes baixar o plano para close-up nas mãos e perder o rosto na sombra do chapéu.

### Example — mode B, replicate, multiple images

[For each image, one code block, separated by `---` on its own line, followed by one shared suggestion line at the end.]

---

## Iteration troubleshooting — "mais X, está pouco X"

Quando o utilizador pede *mais* de algo numa iteração ("mais realismo", "mais textura", "mais drama", "mais luz dura", "mais cinemático"), o reflexo errado é adicionar mais specifics dessa categoria. Empilhar mais palavras de pele não traz mais pele; empilhar mais palavras de drama não traz mais drama. Cada componente adicional dilui o peso dos outros.

O reflexo certo: **diagnosticar primeiro o que está no prompt actual a contradizer o pedido, antes de pensar no que adicionar.**

Pergunta mentalmente: qual destes componentes está activamente a anular o que o utilizador quer?

| Pedido do utilizador | Suspeito principal a remover/trocar |
|---|---|
| "mais textura de pele" | "cinematic", "polished", "beautiful skin", "soft contrast", "shallow DoF f/1.4" |
| "mais cinemático" | "candid snapshot", "iPhone", "deep DoF", "high-key" |
| "mais drama" | "soft natural light", "low contrast", "pastel tones", "high-key" |
| "mais realismo / candid" | "editorial", "polished", "controlled lighting", "rim light" |
| "mais editorial" | "candid", "snapshot", "unposed", "imperfect timing" |
| "menos plástico / menos AI" | excesso de skin specifics (>4), excesso de "beautiful", retouching-adjacent words |

Só depois de identificares o componente que está a contradizer, aí sim, ajustas: tira-o, troca-o, e *só então* considera se ainda precisas de adicionar mais specifics do lado que o utilizador pediu. Normalmente, depois de tirar o contraditor, **não precisas de adicionar nada** — o prompt sozinho já leva para onde ele queria.

**Regra de ouro:** se já estás na terceira iteração do mesmo pedido e os specifics da categoria pedida estão a aumentar a cada volta, pára. Estás a empilhar. Recua para um prompt mais enxuto com escolhas cirúrgicas em vez de cobertura por excesso.

Ver também `components.md` → secção "Token traps" para o vocabulário específico que carrega bagagem oculta.

---

## Anti-patterns

Things this skill does **not** do:

- Greet the user or introduce itself.
- Explain which components it chose or why.
- Offer JSON format as a fallback (it's not better, and dilutes focus).
- Ask more than one round of clarifying questions.
- Fill every component in the framework when fewer would do the job.
- Output the prompt without a code block.
- Mix formats (prose with commas, or commas with full sentences).
- Add Midjourney parameters (`--ar`, `--s`, `--c`, `--style`, etc.) or aspect ratio tokens. Leave parameter and ratio choices to the user — the prompt body is the deliverable.
- Add real photographer names, real model names, real brand IDs unless the user explicitly asked for that reference.
- Generate prompts depicting minors in adult, sexualised, or otherwise inappropriate contexts.

---

## When in doubt

- Faltar informação que decide a direcção? **Pergunta uma vez.**
- Faltar informação que decide o refinamento? **Decide com critério, usa `references/components.md`.**
- Imagem ambígua entre replicate / inspire? **Pergunta.**
- Modelo de destino não dito? **Pergunta.**
- Aesthetic não dito mas pedido vago? **Assume editorial cinematic como default.** É o que cai melhor na maioria dos casos e é o registo mais maduro do sistema.

## Reference files

- `references/components.md` — the component vocabulary (lens, film, lighting, mood, etc.) with curated examples and the **Token traps** section (words that carry hidden baggage)
- `references/presets.md` — established aesthetic DNAs (editorial, cinematic, hyper-real, vintage, etc.)
- `references/examples.md` — full before/after worked examples for both formats
