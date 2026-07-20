# components.md

Vocabulary for building photo prompts. Pick the components that matter for the brief — never fill all of them. Typical advanced prompt uses 10 to 16. Mínimo útil: 8.

Each component has: what it is, when to use, when to skip, curated examples, and (where relevant) combination notes.

---

## 1. Subject

Who or what is in the image. The anchor of the whole prompt.

**When to use:** always.
**When to skip:** never. If you don't know who the subject is, you have no prompt.

**Examples:**
- A weathered Portuguese fisherman in his seventies
- A young woman in her mid-twenties with cropped dark hair
- An elderly Japanese ceramicist with deep-set eyes
- A teenage skater in his early sixteens
- A small white ceramic mug
- A 1972 Citroën DS parked diagonally
- An adolescent Black ballet dancer mid-extension

**Notes on specificity:** "a man" is too vague. "A man in his fifties with a salt-and-pepper beard and a worn navy coat" gives the model anchors. Aim for 2-4 distinguishing traits — not a full character sheet.

---

## 2. Action / Pose

What the subject is doing. Determines composition and emotional read.

**When to use:** almost always, even if it's a stillness ("standing motionless", "sitting"). Static images still have implied posture.
**When to skip:** abstract product shots where the subject is inanimate and centred.

**Examples:**
- Leaning against a doorframe, arms loosely crossed
- Mid-stride, glancing back over the shoulder
- Sitting cross-legged on the floor, reading
- Laughing with head tilted back
- Adjusting a watch on the wrist
- Holding a cigarette, smoke curling upward
- Walking into the frame, partially out of focus
- Standing still, facing camera, expression neutral

**Combination note:** Action sets the energy. "Running" wants motion blur. "Sitting" wants stillness and depth of field. Match downstream components to the action.

---

## 3. Photography Style / Genre

The category the photograph belongs to. Sets the rules for everything else.

**When to use:** almost always — it's the strongest single signal to the model.
**When to skip:** rarely. Even abstract macro is a "style".

**Examples:**
- Editorial fashion photograph
- Documentary photojournalism
- Cinematic still
- Commercial product photography
- Candid street photograph
- Portrait fine-art photograph
- Lifestyle campaign photograph
- Photojournalistic reportage
- Magazine cover editorial
- Behind-the-scenes documentary

**Notes:** Style governs which other components matter. Editorial pushes wardrobe, lighting, mood. Documentary pushes realism, candidness, context. Cinematic pushes mood, colour grading, depth.

---

## 4. Shot Type & Angle

Framing and camera viewpoint. Controls what the viewer sees and how.

**When to use:** almost always.
**When to skip:** when truly defined by the subject (e.g., a still life on a flat surface implies its own framing).

**Shot type examples:**
- Extreme close-up
- Close-up
- Medium close-up
- Medium shot
- Medium wide shot
- Wide shot
- Full body shot
- Establishing wide shot
- Over-the-shoulder shot
- Two-shot

**Angle examples:**
- Eye-level
- Low angle (camera below subject, looking up)
- High angle (camera above subject, looking down)
- Bird's-eye / top-down overhead
- Worm's-eye view
- Dutch angle (tilted horizon)
- Slight three-quarter angle
- Profile (direct side view)

**Combination note:** Close-up + low angle = heroic, imposing. Wide shot + high angle = isolation, vulnerability. Top-down overhead = still life, food, lifestyle flatlay.

---

## 5. Focus / Depth of Field

The focal zone and how much of the image is sharp.

**When to use:** when DoF matters to the read — portraits, product, anything with foreground/background separation.
**When to skip:** when DoF is uniform across the frame (overcast landscape, flat lay).

**Examples:**
- Razor-thin depth of field, only the eyes in focus
- Shallow depth of field with creamy bokeh
- Medium depth of field, subject and immediate surroundings sharp
- Deep depth of field, everything sharp from foreground to background
- Selective focus on the hands, face soft
- Tilt-shift selective focus
- Soft focus across the whole frame
- Sharp critical focus on the lashes, falloff into the cheekbone

**Combination note:** Shallow DoF + 85mm + portrait = classic editorial. Deep DoF + 24mm + landscape = documentary clarity.

---

## 6. Wardrobe

Clothing, fabric, accessories, condition.

**When to use:** any image with a person, unless they're nude or the brief deliberately omits.
**When to skip:** product, landscape, still life, abstract.

**Examples:**
- Faded oversized navy work shirt and wool cap
- Bold red varsity-style knitted zip cardigan with cream sleeves
- Loose linen trousers and bare feet
- Crisp white cotton t-shirt, dark blue selvedge denim, leather boots
- Vintage 1970s flared corduroy trousers and a chunky knit jumper
- Ceremonial brocade kimono with deep indigo dye
- Soft grey hoodie with frayed cuffs
- Tailored black wool coat, silk scarf, leather gloves

**Notes:** include fabric, cut, condition, era when relevant. "A shirt" is weak. "A faded chambray work shirt with rolled sleeves" gives anchor.

---

## 7. Environment / Setting

Where the image takes place — physical space, props, context.

**When to use:** almost always. Environment carries half the storytelling.
**When to skip:** clean studio product shots, portraits on solid backgrounds.

**Examples:**
- A small stone harbour at dawn, wooden boats in soft focus background
- A worn budget hotel room: peeling floral wallpaper, chipped white nightstand, box TV on a dresser
- A sun-drenched kitchen with green tile backsplash and ceramic mugs on open shelves
- A misty pine forest in early autumn, low ground fog
- A brutalist concrete underpass, graffiti tags, wet asphalt
- A mid-century wood-panelled music room, vinyl records stacked against speakers
- A quiet ceramics studio, raw clay surfaces, soft north light
- A neon-lit Tokyo backstreet, wet pavement reflecting signage
- An empty municipal swimming pool, blue tile, late afternoon shadows

**Notes:** describe 3-5 environment anchors. More than that becomes noise. Choose anchors that reinforce the mood.

---

## 8. Camera & Lens

The capture instrument. Defines focal length compression, depth of field behaviour, and image character.

**When to use:** advanced prompts almost always benefit from this. It's a high-leverage signal.
**When to skip:** when explicitly going for a stylised or non-photographic look that doesn't reference real optics.

**Camera body examples:**
- Leica M6 (rangefinder, classic film look)
- Hasselblad 500 C/M (medium format, square)
- Canon EOS R5 (modern digital, clinical sharpness)
- Sony A7R IV (high-res digital, modern colour science)
- Pentax 67 (medium format film, soft tonality)
- Nikon F3 with HP finder (classic 35mm film body)
- Contax G2 (autofocus rangefinder, sharp lens character)
- Mamiya RZ67 (medium format studio workhorse)
- iPhone 15 Pro (modern phone, computational look)
- Disposable Kodak FunSaver (intentionally cheap snapshot)

**Lens examples by focal length and purpose:**
- 24mm f/1.4 — wide environmental portrait, immersive scenes
- 35mm f/1.4 — documentary, street, "natural" perspective
- 50mm f/1.2 — classic portrait, faithful perspective
- 85mm f/1.2 — flattering portrait, beautiful background compression
- 100mm macro — extreme detail, skin texture, product
- 135mm f/2 — isolated portrait with deep compression
- 200mm telephoto — heavy compression, candid distance
- 16-35mm zoom (wide end) — interiors, architecture
- Tilt-shift 90mm — selective focus plane, miniature effect

**Combination note:** Lens choice + DoF + distance = subject feel. 85mm at 2 metres + f/1.4 = classic flattering portrait. 24mm at 1 metre + f/2.8 = environmental immersion, slight wide distortion.

---

## 9. Lighting

Light source, direction, quality.

**When to use:** always. Lighting is the single biggest determinant of mood.
**When to skip:** never.

**Source examples:**
- Soft natural window light from the left
- Hard directional sunlight from above, late afternoon
- Diffused overcast daylight, no defined source
- Single tungsten practical from a table lamp
- Harsh on-camera flash, direct frontal
- Three-point softbox studio setup
- Mixed light: warm interior tungsten + cool blue window
- Candlelight, very low key
- Neon signage spill, magenta and cyan
- Firelight, flickering, warm orange from below

**Quality / character examples:**
- Soft, diffused, low-contrast
- Hard, directional, high-contrast
- Volumetric, with visible light beams
- Dappled, scattered through foliage
- Specular, bright reflections on surfaces
- Rim lighting, strong edge glow around subject
- Chiaroscuro, extreme light and shadow
- Backlit, subject silhouetted against the source
- Sidelit, dramatic falloff to shadow
- Motivated, matching a visible source in scene

**Combination note:** Soft + diffused + warm = intimate, comforting. Hard + side + cool = tense, dramatic. Harsh frontal flash = candid, raw, paparazzi-adjacent.

---

## 10. Time of Day

When the scene happens. Affects light colour temperature and atmosphere.

**When to use:** outdoor scenes, scenes with window light, scenes where temporal mood matters.
**When to skip:** controlled studio environments, deep interior with no daylight, abstract or product.

**Examples:**
- Pre-dawn blue hour
- Dawn, first warm light cresting the horizon
- Early morning, low golden sun
- Mid-morning, clear and bright
- Midday, overhead sun, hard shadows
- Late afternoon, warming light
- Golden hour, low warm directional sun
- Sunset, deep oranges and magentas
- Dusk, blue hour, residual sky glow
- Night, defined by artificial sources
- Late night, deep blue ambient, low key

---

## 11. Mood / Emotion

The emotional register the image should evoke.

**When to use:** almost always. Helps the model resolve ambiguous decisions in your favour.
**When to skip:** when the brief is purely technical (product on white background).

**Examples:**
- Quiet, melancholic, suspended in time
- Tense, restrained, on edge
- Warm, intimate, unguarded
- Triumphant, kinetic, energetic
- Lonely, isolated, vast
- Nostalgic, soft, dreamlike
- Confident, defiant, direct gaze
- Tender, vulnerable, fragile
- Cold, clinical, detached
- Joyful, candid, unposed
- Reverent, solemn, ceremonial
- Erotic, charged, slow

**Notes:** stack 2-3 emotion words for nuance. "Sad" is weak. "Lonely, restrained, quietly hopeful" gives texture.

---

## 12. Textures

Visible materials and surface qualities in the scene.

**When to use:** when texture is part of the read — fabric-heavy editorial, weathered environments, food, skin-focused portraits.
**When to skip:** clean studio, abstract, minimal compositions.

**Examples:**
- Rough hand-knit wool, visible loose fibres
- Smooth glazed ceramic with hairline crackle
- Aged paper, foxed edges, slight tears
- Polished concrete with subtle aggregate showing through
- Weathered painted wood, peeling layers
- Frosted glass, soft diffusion
- Brushed stainless steel
- Crumpled linen, deep wrinkles
- Wet pavement reflecting light
- Cracked dry earth
- Coarse stone wall, deep shadow in the recesses

---

## 13. Era / Period

Historical or seasonal period the image references.

**When to use:** when the period defines the look (vintage, retro, futuristic, seasonal).
**When to skip:** contemporary present-day scenes with no period reference.

**Examples:**
- 1970s analog warmth
- Early 1990s grunge, faded saturation
- Mid-century 1950s Americana
- Edwardian 1910s sepia formality
- Near future, soft sci-fi (2040s)
- Medieval, candlelit, smoky
- Industrial era, late 19th century, soot and steam
- Late summer, dry grass, dusty light
- Deep winter, low sun, blue snow shadows
- Early autumn, golden leaves, low fog

---

## 14. Image Tones / Colour Grading

The overall colour palette and tonal treatment.

**When to use:** advanced prompts almost always benefit. Controls the "look".
**When to skip:** when the natural colour of the scene is the point and no grade is intended.

**Examples:**
- Warm earth tones, ochres and umbers, low saturation
- Cool muted blues and greys, desaturated mid-tones
- High contrast black and white
- Sepia toned, warm browns and creams
- Vibrant punchy saturated palette
- Pastel soft tones, cream highlights
- Teal and orange split-toning
- Faded 1990s Kodak Gold palette, warm and slightly green
- Bleach bypass look, low saturation, high contrast
- Monochrome with a single accent colour
- Cinematic teal shadows, warm skin tones
- Magenta and cyan neon palette

---

## 15. Film Stock

Film emulsion simulation. Sets grain, contrast curve, colour bias.

**When to use:** any time you want a specific photographic character. High leverage for mood.
**When to skip:** clean modern digital looks, hyper-clinical product, ultra-stylised non-photographic outputs.

**Colour negative examples:**
- Kodak Portra 400 — soft warm tones, flattering on skin, editorial classic
- Kodak Gold 200 — nostalgic, warm, slightly green, 1990s home-camera vibe
- Kodak Ektar 100 — vivid saturated, sharp, landscape
- Fujifilm Pro 400H — soft pastel greens, airy, wedding/lifestyle
- Fujifilm Superia 400 — punchy, slight green bias, low-light friendly
- Cinestill 800T — tungsten-balanced, halated highlights, cinematic night

**Slide / transparency examples:**
- Fujifilm Velvia 50 — ultra-vivid, deep reds and greens, landscape
- Kodak Ektachrome E100 — clean neutral, slightly cool
- Fujifilm Provia 100F — balanced, natural, sharp

**Black & white examples:**
- Kodak Tri-X 400 — classic grain, high contrast, photojournalism
- Ilford HP5 Plus 400 — versatile, mid-contrast, reportage
- Ilford Delta 3200 — heavy grain, low-light, gritty
- Fomapan 100 — fine grain, soft mid-tones, European feel

**Specialty / experimental examples:**
- Lomochrome Purple — shifted colour palette, apocalyptic
- Kodak Aerochrome — false-colour infrared, red foliage
- Polaroid SX-70 — vintage instant, soft edges, faded
- Kodak Vision3 500T — cinema motion film, halation, night-friendly

**Notes:** Portra for people, Ektar for landscape, Tri-X for documentary, Cinestill for night. Don't combine multiple film stocks in one prompt — pick one.

---

# Realism layers

The five layers below are **independent**. Activate the ones that fit the brief. Never default to all five — most images need none, some images need one or two, the agente-4-style hyper-real look needs three or four.

When to activate (general principle):
- Brief asks for "real-looking", "candid", "documentary", "iPhone shot", "behind the scenes", "raw" → activate one or more
- Brief asks for "editorial", "fashion campaign", "commercial product", "polished" → activate none or only Layer 1 lightly

---

## Layer 1 — Skin & body realism

Targets pores, texture, asymmetry. Use when faces are the subject and you want them to read as a real person, not a render.

**Examples:**
- Visible pores across the cheeks and nose
- Peach fuzz on the temples and jawline catching the light
- Micro-wrinkles around the eyes when smiling
- Slight facial asymmetry
- Uneven skin tone, faint redness under the eyes
- Natural oils on the forehead and nose
- Light sunburn redness on the cheekbones
- A few freckles scattered across the bridge of the nose
- Faint stubble shadow
- Crease marks from sleep still visible on the cheek
- Chapped lips, light flaking
- Bitten cuticles, uneven manicure
- Flyaway hairs catching backlight
- Smudged eyeliner, slightly imperfect makeup

**Skip when:** polished beauty editorial, retouched fashion campaign, idealised character portrait.

**Dosage:** pick 2-4, not all. Stacking everything creates the "always sweaty/oily" failure mode.

---

## Layer 2 — Lens & optical imperfections

Targets the optical signature of real glass. Use when you want the image to feel "captured", not rendered.

**Examples:**
- Subtle chromatic aberration on high-contrast edges
- Lens flare from harsh backlight, soft hexagonal artefacts
- Soft vignetting falling off into the corners
- Slight barrel distortion near the edges of the frame
- Specular fringing on bright highlights
- Anamorphic horizontal flare streaks
- Coma in the corner highlights
- Mild astigmatism in out-of-focus highlights
- Visible dust on the front element catching light
- Lens breathing softening the edges
- Bokeh with slight onion-ring texture
- Cat's-eye bokeh near the corners

**Skip when:** clean modern digital aesthetic, clinical product, ultra-sharp tech editorial.

**Dosage:** one or two, max. More starts to feel like a filter stack.

---

## Layer 3 — Motion & focus imperfections

Targets the moment of capture being imperfect — slight blur, missed focus, hand-held shake. Use for candid, documentary, raw aesthetics.

**Examples:**
- Slight motion blur on the hands mid-gesture
- Focus slightly off, landing on the ear instead of the eye
- Subtle hand-held camera shake
- Breathing autofocus, soft transition between zones
- Rolling shutter skew on fast horizontal motion
- Subject leaving the frame, motion ghost trailing
- Frame caught at the wrong moment, eye half-closed
- Slight tilt to the horizon
- Off-centre composition, awkward framing
- Subject partially out of focus on the edge

**Skip when:** controlled studio, sharp editorial, commercial product, anything that needs to look "shot perfectly".

**Dosage:** one or two. The point is *one* thing went imperfectly, not the whole capture being a mess.

---

## Layer 4 — Film & analog artifacts

Targets the texture of analog photography — grain, halation, scratches, light leaks. Use to push images toward an analog or vintage feel.

**Examples:**
- Fine film grain across the image
- Medium film grain, more visible in shadows
- Heavy grain, gritty, low-light texture
- Halation glow around the brightest highlights
- Warm light leak bleeding from the right edge
- Faint vertical scratches on the emulsion
- Dust spots and small white specks
- Slight colour shift from expired film stock
- Edge fogging from light exposure
- Visible frame border bleed
- Reciprocity failure shifting shadows toward green
- Push-processed contrast, blocked-up blacks

**Skip when:** modern digital aesthetic, clinical sharpness, contemporary product.

**Combination with Component 15 (Film Stock):** if you've already specified "Kodak Tri-X 400", you've already implied grain — don't add "fine film grain" again. This layer is for *adding more* than the film stock alone implies, or for specifying type/intensity.

**Dosage:** one or two specifics on top of the film stock choice.

---

## Layer 5 — Capture & finish authenticity

Targets the meta-level of the image being a real capture, not a polished output. Use to push toward "this was actually taken, not produced".

**Examples:**
- RAW photo, unedited
- Straight out of camera, no post-processing
- iPhone snapshot, casual, unposed
- Candid moment, unaware subject
- Caught off-balance, slightly clumsy composition
- Imperfect timing, missed peak action
- Behind-the-scenes capture, not the hero shot
- Documentary frame, no styling
- Phone screenshot quality
- Disposable camera aesthetic
- Webcam capture quality
- Polaroid instant print, faded edges

**Skip when:** editorial, commercial, polished, hero shot, campaign.

**Dosage:** one phrase usually does the whole job. "RAW photo, unedited" is often enough.

---

# Token traps — vocabulário com bagagem oculta

Certas palavras carregam associações implícitas no treino dos modelos que vão **contra** o que normalmente pretendes quando as escreves. Não são palavras erradas — são palavras que activam um filtro escondido. Reconhecer estes traps é o que distingue um prompt que pede X e recebe X de um prompt que pede X e recebe a versão suavizada de X.

A regra geral: **se a saída está "demasiado suave / demasiado polida / demasiado AI", procura primeiro um token trap activo antes de adicionar mais specifics correctivos.**

## "cinematic"

**O que tu queres:** drama, mood, profundidade, atmosfera de filme.
**O que o modelo lê:** look de cinema digital contemporâneo (Roger Deakins, Hoyte van Hoytema) → soft contrast, low-lifted blacks, controlled lighting, **pele suavizada por defeito**.
**Sintoma:** pediste textura de pele em paralelo e a pele saiu plástica/lisa apesar dos specifics.
**Alternativas conforme o que queres realmente:**
- Drama de luz e sombra → "low-key lighting, hard directional sidelight, deep shadows"
- Profundidade emocional → "intimate", "contemplative", "quiet mood"
- Look de filme com grão e halation → vai directo aos specifics: "Cinestill 800T", "halation", "fine grain", "Kodak Vision3"
- Cor de cinema → "teal shadows, warm skin tones, split-toning"

Usa "cinematic" **só** quando queres mesmo o pacote suavizado moderno (campanha de perfume, capa de magazine, retrato editorial polido).

## "polished" / "polido" / "refined"

**Bagagem:** anula automaticamente realism layers, mesmo se as escreveres a seguir. O modelo dá prioridade a "polished" e descarta os specifics de pele textured.
**Não combinar com:** Layer 1 (skin realism), Layer 3 (motion imperfections), Layer 5 (capture authenticity).
**Alternativa para retrato refinado sem perder pele:** "controlled lighting, intentional composition, magazine editorial" sem dizer polished.

## "beautiful skin" / "flawless skin" / "perfect skin"

**Bagagem:** puxa para retouched / beauty-campaign feel, mesmo se pedires poros na frase seguinte. O modelo prioriza "beautiful" sobre "pores".
**Alternativa:** descreve o que queres ver — "natural skin texture, visible pores, peach fuzz" — sem qualificadores avaliativos.

## "Arri Alexa" / "cinema camera" / "motion picture film"

**Bagagem:** puxa para look de filme em movimento moderno → suave, low contrast, skin smoothing. Bom para mood cinematográfico, **mau para textura de pele still**.
**Quando queres textura still + drama:** prefere câmaras associadas a fotografia editorial — Canon 5D Mark IV, Leica M11, Hasselblad H6D, Pentax 67 (para film look). Estas têm associação de treino com still photography não-suavizada.
**Quando queres mesmo motion picture look:** mantém Arri/Vision3 mas aceita que a pele vai sair mais suave; não tentes empilhar Layer 1 por cima — não vai vencer.

## "f/1.4" / "f/1.2" + retrato

**Bagagem:** muito shallow DoF não esconde textura por filtro, esconde-a por **bokeh** — o foco crítico cai numa zona milimétrica e o resto da cara está fora dela. O modelo vai renderizar pele "soft" porque está fora do plano focal.
**Quando queres textura de pele visível em toda a cara:** sobe para **f/4 a f/8**. Sim, perdes o creamy bokeh editorial. Compensa.
**Excepção:** macro portrait com 100mm f/2.8 — aí o foco crítico está exactamente na pele e o resto da cara fica fora, mas a zona em foco tem textura extrema.

## "soft light" / "soft contrast" / "diffused light"

**Bagagem:** anula relevo. Pele só revela poros quando há luz direccional a rasgá-la. Soft light = pele lisa por física, antes de qualquer escolha do modelo.
**Para textura:** "hard directional sidelight", "raking sidelight", "harsh on-camera flash", "harsh midday sun".

## "candid" + "editorial" no mesmo prompt

**Bagagem:** conflito interno. O modelo faz média e sai-te o pior dos dois — nem natural, nem refinado. Escolhe um e injecta 1-2 elementos do outro (ver `presets.md` "Como usar os presets" para a regra de merge).

## "high-key" / "bright" / "airy"

**Bagagem:** mata sombras, mata drama, mata relevo. Bom para lifestyle solar / wellness / Scandinavian; mau para qualquer pedido com "mood", "moody", "atmospheric", "drama".

## "AI", "stylized", "rendered"

**Bagagem óbvia:** puxa para look 3D/render/digital art. Nunca uses em prompts foto-realistas, nem como negativo (modelos image-gen não suportam negative prompts bem; só vais reforçar a palavra).

## Como diagnosticar um token trap no teu prompt

Se a saída está a falhar consistentemente apesar de specifics correctos:

1. Lê o prompt linha a linha procurando qualquer palavra da lista acima.
2. Para cada uma que encontrares, pergunta: *isto está aqui porque preciso mesmo, ou está aqui por hábito / porque soa bem?*
3. Se for hábito, remove ou troca pela alternativa.
4. Só depois disso, considera adicionar mais specifics do lado que o utilizador pediu.

---

# Canonical combinations → see `presets.md`

The full set of established aesthetic DNAs (Editorial cinematic, Documentary photojournalism, Cinematic moody, Hyper-real macro, Vintage 1970s warm, Vintage 1990s grunge, Commercial product, Lifestyle candid, Fashion campaign, B&W fine-art) lives in `references/presets.md`. That file is the single source of truth for preset combinations — consult it when the brief signals a named aesthetic, or when defaulting to Editorial cinematic on ambiguous briefs.

This file (`components.md`) is the **vocabulary**. `presets.md` is the **starting recipes**. Use both together: presets give a base, components let you adapt.
