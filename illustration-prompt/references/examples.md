# examples.md

Worked examples for both output formats and both input modes. These are reference patterns — not templates to copy literally. Each shows: user input, internal reasoning (briefly), final output.

---

## Example 1 — Text brief, Nano Banana destination, flat geometric vector default

**User:** "prompt nano banana de uma ilustração de uma rapariga a beber café numa esplanada de Lisboa"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- No style trigger explicit, default to flat geometric vector with grain
- Pull the preset, adapt to subject (rapariga + café Lisboa)

**Output:**

```
A flat geometric vector illustration with subtle grain of a young woman in her late twenties sitting at a small outdoor café table in Lisbon, holding a cup of espresso in both hands. Style DNA: flat geometric vector with grain. She wears a striped t-shirt and rounded glasses, hair pulled back loosely. The café table sits on the centre-left of the frame, with a calçada portuguesa pattern of small black and cream tiles visible underfoot, simplified into a geometric grid. Behind her, the facade of a traditional pastel-yellow Lisbon building with rectangular windows and decorative azulejo trim along the ground floor. A simple round tree in soft sage green sits in the background. Strictly lineless throughout — all shapes defined by clean Bezier-edge colour blocks, no outlines. Forms are simplified geometric: cylindrical coffee cup, oval table, rounded character silhouette. Light is flat with a subtle two-tone cel-shade on the building facade and her shirt. Fine noise grain overlay across the whole image gives a printed retro feel. Colour palette is warm and limited: pastel butter yellow, soft terracotta, sage green, cream, with deep navy as the accent on her shirt stripes and hair. Solid pastel sky background, slightly cream. No photorealism, no 3D render, no realistic shading, no detailed textures, no gradients, no line art.
```
→ Para uma versão mais editorial publicação, posso adicionar um título conceptual em letras geométricas atrás dela, tipo capa de revista.

---

## Example 2 — Text brief, Midjourney destination, watercolour editorial

**User:** "prompt midjourney aguarela editorial de um pescador a remendar rede"

**Internal reasoning:**
- Mode: A (text)
- Destination: Midjourney → comma-separated, <9 words per component
- Style trigger: "aguarela editorial" → Watercolour editorial preset
- Adapt to subject

**Output:**

```
watercolour editorial illustration, elderly Portuguese fisherman mending a fishing net, three-quarter view seated, weathered hands focused on the work, loose expressive brushwork, controlled watercolour bloom on the jacket and hat, hard pigment edges where paper dried, soft wash fading to cream background, cold-press cotton paper grain visible throughout, optional thin ink line accents on the net and hands, muted earth palette of burnt sienna indigo and warm ochre, single warm light source from upper-left, slight bleed into the paper fibre, deckled paper edges suggested, no photorealism, no digital flatness, no 3D, no vector outlines, no airbrush gradients
```
→ Para empurrar o registo mais íntimo, fecha o plano em close-up só das mãos no nó e perde o rosto fora do enquadramento.

---

## Example 3 — Text brief with ambiguity, asks one question

**User:** "prompt para uma ilustração de um robot"

**Internal reasoning:**
- Mode: A (text)
- Destination: not specified
- Style: completely ambiguous — could be flat vector, pixel art, watercolour, cel-shaded anime, isometric, hand-drawn, retro 1-bit
- Bundle the two critical questions

**Output (skill's response, not a prompt yet):**

Para chegar ao melhor prompt preciso de saber duas coisas:
1. Que registo de ilustração? (flat vector moderno / pixel art / aguarela / cel-shaded anime / isométrico / hand-drawn / outro)
2. Para que modelo? (Midjourney = vírgulas, Nano Banana / GPT Image / Flux / Gemini = prosa)

---

## Example 4 — Image reference, replicate mode, Nano Banana

**User uploads an illustration of a young hero on a rock with monsters in the mist (the indie game style from the PDF). Says:** "transforma isto em prompt para nano banana"

**Internal reasoning:**
- Mode: B, replicate, Nano Banana → prose
- First lock down Style DNA: lineless indie game vector
- Then describe SIMULATE → RENDER → LOOK observations

**Output:**

```
An atmospheric vector silhouette fantasy illustration. Style DNA: lineless indie game vector. The scene shows a young boy standing center-stage on a stylised sharp-edged rock platform, facing forward, with brown hair and a small blonde top-knot, wearing a teal-blue and orange jacket with dark blue trousers. Small orange flowers and blue plant silhouettes sit on the platform, and a warm golden light pools below the platform. Surrounding him in the midground, dark clean-edged monstrous silhouettes emerge from cyan mist — a large hulking horned beast with massive glowing cyan eyes as the central midground figure, and smaller monstrous silhouettes to either side with distinct glowing cyan mouths and features. A prominent hanging glowing purple teardrop wisp is suspended on the upper left, scattered small cyan wisps throughout, and a pervasive dense glowing cyan fog separates all layers. The background is a deep multi-layered dark blue forest silhouette of dense tree trunks and foliage stretching vertically into the distance. Strictly lineless throughout — all shapes defined by clean vector colour fills, no stroke outlines. Forms are rounded and friendly for the boy, immense imposing monolithic silhouettes for the monsters. Surface is flawless smooth digital, zero noise or grain. Lighting is extreme atmospheric depth via dense glowing cyan volumetric fog, with minimal flat cell-shading only on the boy's jacket and hair patch. Monsters are near-black flat silhouettes with only glowing features. Controlled optical bloom and diffusion on glowing elements only. Colour palette is highly analogical deep cool palette of midnight blues, cyan mist, teal forest, with strong focal contrast from warm elements (blonde hair, orange jacket, golden light below) and highly saturated glows (cyan eyes, purple wisp). Multi-layered parallax depth with deep-blue tree trunks separated by glowing mist. No black outlines, no line art, no realism, no 3D rendering, no complex anatomical realism, no rough textures, no noise, no visible brushwork, no photorealism, no dull or muted colours.
```
→ Posso gerar uma variação onde o boy é substituído por uma rapariga com vestido vermelho, mantendo todo o resto do estilo intacto.

---

## Example 5 — Image reference, inspire mode

**User uploads the same image and says:** "inspira-te neste estilo para uma cena de uma astronauta numa floresta alienígena"

**Internal reasoning:**
- Mode: B, inspire
- Extract style DNA only: lineless indie game vector, cool palette with warm accents, volumetric fog, glowing wisps, multi-layered silhouettes, cel-shaded foreground character
- Drop original subject (boy + monsters)
- Apply DNA to new subject (astronauta + floresta alienígena)
- Destination ambiguous — verb "inspira-te" implies prose-friendly model. Assume Nano Banana, offer correction in suggestion.

**Output:**

```
An atmospheric vector silhouette sci-fi illustration. Style DNA: lineless indie game vector. The scene shows a lone astronaut standing center-stage on a stylised sharp-edged rock outcrop, facing forward, helmet visor glowing with a warm amber light, wearing a clean-silhouette white spacesuit with subtle orange accent details. The outcrop is dotted with small bioluminescent flora — tiny glowing teal mushrooms and crystalline stems. A warm amber light pools beneath the astronaut's feet, casting a small halo. In the midground, alien tree silhouettes rise from a glowing magenta mist — twisted trunks with bulbous canopies and exposed root structures, each form clean-edged and monolithic. Floating spores drift across the frame as small glowing pink wisps, and a larger magenta orb hovers suspended in the upper left, pulsing softly. Pervasive dense glowing magenta fog separates the depth layers. The background recedes into a deep multi-layered dark blue alien forest silhouette of impossibly tall trees, stretching upward into a dark indigo sky with a single distant ringed planet visible. Strictly lineless throughout — all shapes defined by clean vector colour fills, no stroke outlines. Forms are clean and silhouette-driven, with the astronaut as the only character anchor. Surface is flawless smooth digital, zero noise or grain. Lighting is extreme atmospheric depth via dense glowing magenta volumetric fog, with minimal flat cell-shading only on the astronaut's suit and visor. Controlled optical bloom on all glowing elements. Colour palette is deep cool indigo and dark teal with bold magenta and amber accents — strong focal contrast from the warm helmet visor and ground-pool light against the magenta alien fog. Multi-layered parallax depth with mist separating planes. No black outlines, no line art, no realism, no 3D rendering, no rough textures, no noise, no photorealism, no muted colours.
```
→ Se preferires Midjourney, posso reformular o mesmo prompt em vírgulas. Confirma o modelo se quiseres a versão alternativa.

---

## Example 6 — Risograph, controlled imperfections

**User:** "prompt nano banana de um cartaz de concerto estilo risograph com um músico a tocar guitarra"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- Style trigger: "risograph" → Risograph two-colour preset
- Activate Layer 2 (print) and Layer 3 (paper) — essential for riso
- Pick a classic riso palette: fluorescent pink + federal blue

**Output:**

```
A two-colour risograph concert poster illustration of a young musician playing electric guitar mid-performance, head tilted back, hair flying. Style DNA: risograph two-colour print. The musician is shown three-quarter view, captured in a dynamic asymmetric pose, the guitar slung low, one hand on the neck and the other strumming. Behind him, abstract sound-wave shapes radiate outward in concentric arcs. The composition is bold and graphic, the musician occupying the lower half of the poster, sound shapes filling the upper half. Forms are simplified into bold blocks that read well in spot colour — silhouette-driven body, simplified facial features, instrument reduced to essential shapes. Strictly two-colour spot ink — fluorescent pink and federal blue — overprinting in some areas to create a deep magenta third tone. Slight registration shift of about 4 pixels between the pink and blue layers gives the print its characteristic offset. Medium halftone dots fill the mid-tones in the figure and the background sound waves, with solid blocks of spot colour for the dominant shapes. Ink saturation varies subtly across the print, with slight pooling in the solid blocks and dry-brush hairlines where the ink ran out at edges. The whole image sits on a slightly cream risograph paper stock, with the paper grain showing through the lighter areas. No photorealism, no 3D, no smooth gradients, no full-colour photography, no clean digital sharpness, no realistic shading.
```
→ Posso gerar uma variação com paleta teal + fluorescent orange para um registo mais quente e menos clássico.

---

## Example 7 — Multiple images, replicate mode

**User uploads 2 illustrations and says:** "extrai os prompts destas duas"

**Internal reasoning:**
- Mode: B, replicate, two images
- Format: separate code blocks, separated by `---` on its own line, one suggestion line at the end

**Output:**

```
[Full prompt for image 1, in Nano Banana prose or Midjourney comma format — destination decided as usual]
```

---

```
[Full prompt for image 2]
```

→ As duas ilustrações partilham a paleta cool e a abordagem lineless. Se quiseres uma terceira variação que combine subject da #1 com palette da #2, pede.

---

## Example 8 — Style fusion (two presets crossed)

**User:** "prompt nano banana de aguarela mas com linha forte de marker preto, retrato de uma rapariga com flores"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- Two preset triggers: Watercolour editorial (dominant — "aguarela") + Hand-drawn ink editorial (secondary — "linha forte de marker preto")
- Use watercolour as base, inject the ink line element
- Don't blend 50/50 — watercolour wins on tool/surface/colour, ink wins on line behavior

**Output:**

```
A watercolour and ink editorial illustration of a young woman with short cropped dark hair surrounded by oversized flowers — peonies and dahlias in warm coral and dusty rose tones cascading around her shoulders. Style DNA: watercolour editorial with confident ink line. She is shown close-up three-quarter view, eyes lowered, gentle smile, hands raised lightly to one cheek. Painted in watercolour on cold-press cotton paper, with controlled bloom on the flower petals where the wet edges spread, hard pigment edges where the paper dried at the silhouette of her hair, and visible bleed into the paper fibre. Over the watercolour wash, a confident bold ink line in pure black defines the silhouette of her face, hands, hair, and the outer edges of the flowers — thick variable-weight strokes with occasional double-pass and slight overshoot at corners. The line is laid down with a brush pen or marker, with pooled ink at stroke starts and dry-brush hairlines where the ink ran out. Background fades to soft warm cream paper, untouched in the upper corners. Cold-press paper grain visible throughout the painted areas. The palette is warm and muted: coral, dusty rose, terracotta, with deep indigo shadows in the flowers and pure black ink as the strongest contrast. Soft implied light from the upper-left, suggested only by colour temperature shifts on the cheek and petals. No photorealism, no digital flatness, no 3D, no vector outlines, no airbrush gradients.
```
→ Para uma variação mais gráfica, posso engrossar ainda mais a linha de marker e simplificar a paleta de aguarela para apenas dois tons.

---

## Example 9 — Integrated text in poster (specific case)

**User:** "prompt nano banana de um cartaz risograph para um festival de jazz com o texto 'BLUE NIGHTS' em letras grandes"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- Style trigger: "risograph" → Risograph two-colour preset
- **Integrated text present** — must include exact text in double quotes and specify typography character + placement
- Reduction Level: iconic (poster), Mood: bold expressive

**Output:**

```
A two-colour risograph jazz festival poster with the title "BLUE NIGHTS" rendered in large bold geometric sans-serif letters with slight ink-pooled imperfections, set at the top of the composition arched gently over a stylised silhouette of a saxophonist mid-performance. Style DNA: risograph two-colour print. The saxophonist is shown three-quarter back view, head tilted up toward the title, the instrument silhouetted in the lower-third of the frame, simplified into bold geometric shapes that read clearly in spot colour. Below the figure, smaller text reads "Lisbon · September 12–14" in a condensed slab serif. Strictly two-colour spot ink — fluorescent pink and federal blue — overprinting in some areas to create a deep magenta third tone. Slight registration shift of about 4 pixels between layers gives the print its characteristic offset. Medium halftone dots fill the mid-tones around the figure, with solid blocks of spot colour for the dominant silhouette. Ink saturation varies subtly with slight pooling in solid blocks and dry-brush hairlines at edges. The whole image sits on slightly cream risograph paper stock with paper grain showing through the lighter areas. Iconic poster reduction — figure and type are the only elements, vast negative space carries the composition. Bold, expressive, raw mood. No photorealism, no 3D render, no smooth airbrush gradients, no photographic detail, no realistic shading.
```
→ Para variação alternativa, posso trocar a paleta para teal + fluorescent orange e baixar a tipografia para uma slab serif decorativa mais quente.

---

# Patterns to internalize

Looking across the examples above:

- **One prompt + one suggestion line.** Never more, never less. The suggestion is concrete and actionable, not vague encouragement.
- **English in the code block, Portuguese in the suggestion.**
- **Medium anchor at the start.** Every prompt opens with an explicit medium declaration ("A flat geometric vector illustration of...", "A watercolour painting of...", "A risograph print depicting...") to prevent photographic drift.
- **Style DNA leads the descriptive load** — it's the single most leveraged phrase. State it explicitly right after the medium anchor or as part of the opening sentence.
- **Physics of Style is non-negotiable** when a tool is named. "Watercolour" alone is weak. "Watercolour with controlled bloom on wet edges, hard pigment edges where paper dried, bleed into the fibre" is what makes the prompt work.
- **Reduction Level and Mood stated explicitly when they differ from the style's default.** Don't assume "moderate detail + neutral mood" — say what you mean.
- **Integrated text: exact text in double quotes + typography character + placement.** Never invent or use placeholder Lorem Ipsum. Ask once if the user didn't provide it.
- **Negative Prompt / AVOID is almost always included.** 4-7 exclusions, opposite of the chosen style. Protects from defaults.
- **Components used: 10-16, rarely more.** Padding hurts.
- **Imperfection layers used sparingly and intentionally.** Default off. Activate per style — riso needs Layer 2+3, watercolour needs Layer 3, vector clean often needs none.
- **Replicate stays faithful, inspire extracts style DNA only.** Inspire is the more common mode for illustration references.
- **No author / studio names inside the output prompt.** Use the descriptive equivalent instead. Author triggers ("Niemann style") are detection cues only.
- **Clarifying questions are rare and bundle multiple decisions.** Maximum one round.
- **Suggestion line points to a real next move** — a tweak, a variation, a continuation — not a generic "tell me if you want changes".
- **Internal SIMULATE / RENDER / LOOK structure stays internal.** Never expose stage names as section headers in the output. The output is plain prose or comma-separated keywords, nothing else.
