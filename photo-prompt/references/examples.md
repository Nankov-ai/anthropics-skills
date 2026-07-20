# examples.md

Worked examples for both output formats. These are reference patterns — not templates to copy literally. Each shows: user input, internal reasoning (briefly), final output.

---

## Example 1 — Text brief, Nano Banana destination, editorial cinematic default

**User:** "preciso de um prompt para nano banana de uma rapariga a olhar pela janela num quarto de hotel barato, vibe melancólica anos 90"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose format
- Direction: clear — "vibe melancólica anos 90" tells me Y2K / 1990s preset with editorial framing
- No clarifying question needed

**Output:**

```
A photorealistic medium shot of a young woman in her mid-twenties sitting on the edge of an unmade bed, gazing out a tall hotel window with one hand resting on the glass. She wears a faded oversized grey t-shirt and loose denim jeans. The room is a worn budget hotel: peeling floral wallpaper, a chipped white nightstand, an old box TV on a dresser, beige curtains pulled half open. Soft overcast daylight pours in from the window, wrapping her face in cool diffused light and casting long shadows across the bed. The mood is quiet, melancholic, suspended in time. Shot on a 35mm lens with shallow depth of field, faint film grain, slightly desaturated tones, 1990s Kodak Gold 200 colour palette. Subtle imperfections — slight focus softness, natural skin texture, no retouching.
```
→ Para empurrar mais o registo dos anos 90, podemos trocar a Kodak Gold por Fujifilm Superia e adicionar uma leve aberração cromática nas bordas.

---

## Example 2 — Text brief, Midjourney destination, documentário

**User:** "prompt midjourney foto de um pescador idoso a remendar rede ao amanhecer"

**Internal reasoning:**
- Mode: A (text)
- Destination: Midjourney → comma-separated keywords
- Direction: clear — "pescador a remendar rede ao amanhecer" pede documentário, naturalista
- Preset: Documentary photojournalism, variação cor (porque "amanhecer" implica light dourada que merece cor)

**Output:**

```
editorial documentary photograph, medium shot, weathered Portuguese fisherman in his seventies mending a fishing net, hands cracked and tanned, faded blue work shirt and wool cap, small stone harbour at dawn, wooden boats in soft focus background, golden first light from the east, low contrast warm tones, sense of routine and solitude, Leica M6 with 50mm Summicron, Kodak Portra 400, fine grain, RAW unedited
```
→ Para um registo mais íntimo, podes baixar o plano para close-up nas mãos e perder o rosto na sombra do chapéu.

---

## Example 3 — Text brief with ambiguity, asks one question

**User:** "faz-me um prompt para uma foto de uma mulher"

**Internal reasoning:**
- Mode: A (text)
- Destination: not specified — but the genre ambiguity is bigger, ask that first
- Direction: completely ambiguous — could be editorial, documentário, fashion, beauty, retrato fine-art
- One question, bundles the critical decisions

**Output (the skill's response, not a prompt yet):**

Para chegar ao melhor prompt preciso de saber duas coisas:
1. Que registo? (editorial / documental / fashion campaign / retrato fine-art / candid lifestyle / outro)
2. Para que modelo? (Midjourney = vírgulas, Nano Banana / GPT Image / Flux / Gemini = prosa)

---

## Example 4 — Image reference, replicate mode, Nano Banana

**User uploads an image of a man lying on a rug listening to vinyl, and says:** "transforma isto em prompt para nano banana"

**Internal reasoning:**
- Mode: B (image)
- Verb "transforma isto em prompt" → replicate
- Destination: Nano Banana → prose
- Describe what you see, don't invent

**Output:**

```
A photorealistic high-end editorial lifestyle photograph of a young Black man relaxing on the floor of a warm vintage-inspired music room, lying diagonally across a textured brown wool rug and a cream carpet while listening to vinyl records through classic wired over-ear headphones. He is holding a plain matte blue vinyl record sleeve with both hands, studying it calmly with a focused, introspective expression. He wears a bold red varsity-style knitted zip cardigan with cream sleeves and striped ribbed cuffs, loose light-gray trousers, and a dark navy ribbed beanie. The room is filled with analog music details: a mid-century wooden record cabinet on the left, open shelves with stacked vinyl records, tall vertical stacks of worn LP sleeves leaning against a wooden speaker cabinet, a large black vinyl record resting on a pile of albums near his head. Top-down overhead camera angle as if photographed from above, subject placed diagonally from lower-left to center-right. Warm natural sunlight from the upper-left side, like late afternoon golden-hour window light, creating soft defined shadows on the rug and warm reflections on the wooden furniture. Shot on a full-frame camera with a 35mm lens, Kodak Gold 200 film aesthetic, warm color grading, subtle film grain, natural skin texture.
```
→ Para uma variação mais cinemática, troca a Kodak Gold por Cinestill 800T e empurra o lighting para mais low-key, com a luz a entrar apenas pela esquerda.

---

## Example 4b — Image reference, replicate mode, Midjourney destination

**Same image as Example 4 (man on rug, vinyl records). User says:** "extrai isto em prompt para midjourney"

**Internal reasoning:**
- Mode: B (image), replicate
- Destination: Midjourney → comma-separated keywords, <9 words per component
- Same visual information as Ex.4 but compressed and reordered for MJ token weighting

**Output:**

```
high-end editorial lifestyle photograph, top-down overhead shot, young Black man lying diagonally on a textured brown wool rug, holding a matte blue vinyl record sleeve with both hands, wearing red varsity-style zip cardigan with cream striped sleeves, light-gray trousers, dark navy ribbed beanie, classic wired over-ear headphones, vintage music room with mid-century wooden record cabinet, stacked vinyl LPs, wooden speaker cabinet, warm late afternoon golden-hour sunlight from upper-left, soft defined shadows on the rug, warm reflections on wood, nostalgic intimate cozy mood, 35mm lens on full-frame camera, Kodak Gold 200 film aesthetic, warm color grading, subtle film grain, natural skin texture
```
→ Se quiseres uma versão mais editorial, sobe o ângulo para slight three-quarter e adiciona "1970s magazine spread aesthetic" perto do início.

---

## Example 5 — Image reference, inspire mode

**User uploads the same image and says:** "inspira-te nesta foto para um prompt de uma rapariga a desenhar numa cozinha"

**Internal reasoning:**
- Mode: B (image)
- Verb "inspira-te" → inspire
- Extract style DNA only: top-down overhead, warm golden-hour, Kodak Gold, mid-century lived-in, slight diagonal composition, 35mm
- Apply to new subject: rapariga a desenhar numa cozinha
- Destination not specified — but verb implies prose-friendly model. If ambiguous, ask. Here I'll assume Nano Banana and offer correction in the suggestion line.

**Output:**

```
A photorealistic high-end editorial lifestyle photograph of a young woman in her late twenties sitting cross-legged on the kitchen floor, leaning over a small sketchbook resting on her lap, pencil in hand, drawing with calm focused attention. She wears an oversized cream linen shirt with sleeves rolled to the elbows and faded olive trousers, bare feet against terracotta tile. The kitchen is warm and lived-in: pale yellow cabinets with brass handles, a worn wooden countertop with a ceramic mug and an open notebook, dried herbs hanging near a sunlit window, a small woven rug under her. Top-down overhead camera angle as if photographed from above, subject placed diagonally across the frame. Warm late afternoon golden-hour sunlight pours in from the upper-left, creating soft defined shadows on the tile and warm highlights on her hair and the cream linen. Shot on a full-frame camera with a 35mm lens, Kodak Gold 200 film aesthetic, warm color grading, subtle film grain, natural skin texture.
```
→ Se o destino for Midjourney, posso reformular o mesmo prompt em vírgulas. Confirma o modelo se preferires.

---

## Example 6 — Hyper-real macro portrait, balanced (not exagerated)

**User:** "prompt nano banana para um retrato macro hyper-realista de um homem de 40 anos com barba por fazer, flash direto"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- Preset: Hyper-real macro portrait
- Skin layer dosage: 2-3 specifics adequados a homem 40+ (stubble, slight oiliness, micro-wrinkles around eyes) — NOT all eight specifics
- No Layer 4 (digital, not film)

**Output:**

```
A raw close-up portrait of a man in his early forties facing the camera directly, captured with a 100mm macro lens at razor-thin depth of field, only his eyes in sharp focus. He has cropped dark hair starting to grey at the temples, three-day stubble shadow across his jaw, and tired blue eyes with faint creases at the corners. He wears a plain charcoal cotton t-shirt. Lit by harsh on-camera flash, direct frontal, creating bright specular highlights on his forehead and the bridge of his nose. Visible pores across the cheeks, micro-wrinkles around the eyes, slight oiliness on the T-zone — natural skin texture, unretouched. Clean digital capture, neutral colour balance, slight chromatic aberration on the high-contrast edges of his shoulders. The mood is direct, unguarded, confrontational. Background is a soft out-of-focus warm grey wall.
```
→ Posso gerar um prompt de continuação para zoom-in extremo num único olho mantendo o lighting e ângulo da câmara, se quiseres a versão "Nano Banana detalhe".

---

## Example 7 — Multiple images, replicate mode

**User uploads 2 images and says:** "extrai os prompts destas duas"

**Internal reasoning:**
- Mode: B, replicate, two images
- Format: separate code blocks, separated by `---` on its own line, one suggestion line at the end covering both

**Output:**

```
[Full prompt for image 1, in Nano Banana prose format or Midjourney comma format — destination decided same way as single-image case]
```

---

```
[Full prompt for image 2]
```

→ Os dois prompts partilham a paleta de tons quentes e o uso de luz natural. Se quiseres uma terceira variação que combine elementos dos dois (subject de #1 no environment de #2), pede.

---

## Example 8 — Brief with strong creative direction, no preset trigger

**User:** "prompt nano banana, um cão a correr numa praia ao crepúsculo, slow motion vibe, sentido de liberdade"

**Internal reasoning:**
- Mode: A (text)
- Destination: Nano Banana → prose
- No preset trigger explicitly, but "crepúsculo + slow motion vibe + liberdade" → cinematic moody adjacent, with golden hour
- Decide on freeze-motion shutter feel rather than literal slow motion blur (because slow motion blur in stills = motion blur, which contradicts "freedom" which wants sharpness with kinetic energy)

**Output:**

```
A photorealistic wide cinematic shot of a large golden mongrel dog mid-stride running along an empty Atlantic beach at dusk, ears flying back, paws kicking up small sprays of wet sand. The horizon is low in the frame, vast open sky stretching above, deep blues bleeding into warm magenta and apricot tones from the setting sun behind heavy clouds. The sea breaks softly in the background, waves catching the last warm light. Shot on a 50mm lens with medium depth of field, fast shutter freezing motion, the dog crisp against soft motion of the spray. Cinestill 800T film aesthetic, halated highlights around the brightest sky tones, cinematic teal-magenta grade, low contrast. The mood is open, free, suspended. Subtle film grain, natural authentic capture.
```
→ Para empurrar o sentido de movimento, posso fazer uma versão com leve motion blur nas patas e na cauda mantendo o corpo nítido.

---

# Patterns to internalize

Looking across the examples above:

- **One prompt + one suggestion line.** Never more, never less. The suggestion is concrete and actionable, not vague encouragement.
- **English in the code block, Portuguese in the suggestion.**
- **Components used: 10-16, rarely more.** Padding hurts.
- **Realism layers used sparingly and intentionally.** Default off. Activate when brief signals raw/candid/real.
- **Replicate stays faithful, inspire extracts style DNA only.**
- **Clarifying questions are rare and bundle multiple decisions.** Maximum one round.
- **Suggestion line points to a real next move** — a tweak, a variation, a continuation — not a generic "tell me if you want changes".
