# presets.md

Estabelecidas estéticas / DNAs visuais que servem de ponto de partida quando o utilizador sinaliza um registo conhecido ("flat vector", "watercolour", "risograph", "indie game", "isométrico", etc.).

Cada preset é uma **constelação de componentes** que se sabe que funcionam bem juntos — não um template rígido. Adapta sempre ao brief específico. O preset diz "isto é a base", não "isto é o resultado final".

Quando o utilizador disser um destes nomes (ou um sinónimo claro), começa pelo preset. Depois ajusta ao subject/action/scene específicos do pedido. Componentes não listados no preset podem (e devem) ser adicionados conforme necessário.

---

## Reduction Level and Mood defaults per preset

Each preset has a "natural" reduction level and mood register. The DNA blocks below don't list these explicitly to avoid noise, but use these defaults when the brief doesn't specify:

| Preset | Default reduction | Default mood register |
|---|---|---|
| Flat geometric vector with grain | light-to-moderate detail | clean, optimistic, neutral |
| Lineless indie game vector | moderate detail | atmospheric, contemplative, adventure |
| Watercolour editorial | moderate detail | contemplative, intimate, soft |
| Risograph two-colour print | iconic-to-moderate | bold, expressive, slightly raw |
| Cel-shaded anime keyframe | moderate-to-detailed | emotional, cinematic, dynamic |
| Isometric pixel diorama | highly detailed | charming, cosy, neutral |
| Hand-drawn ink editorial | iconic minimalism | conceptual, witty, restrained |
| Children's book gouache | moderate detail | warm, whimsical, gentle |
| 1-bit retro pixel | iconic | nostalgic, mysterious, retro |
| Modern conceptual minimal | iconic minimalism | bold, witty, contemporary |

Override the default when the brief contradicts. "A risograph maximalist mural" needs maximalist reduction even though riso defaults to iconic-to-moderate.

---

## Flat geometric vector with grain

**Default para briefs vagos.** O registo contemporâneo mais consistente — Apple/Notion/Stripe modern, indie startup, illustration editorial limpa. É a aposta segura quando não há outro sinal.

**Triggers:** "flat vector", "vector moderno", "ilustração limpa", "indie style", "Apple style", "Notion style", "moderno", "minimalist illustration", pedidos vagos sem direcção clara.

**DNA:**
- Style DNA: flat geometric vector with subtle grain
- Tool: vector pen tool with boolean operations
- Line Behavior: strictly lineless, shapes defined by colour contrast
- Form Construction: perfect geometric primitives, exaggerated stylised proportions
- Physics of Style: razor-clean Bezier edges, perfectly closed shapes
- Surface: light noise grain overlay
- Lighting: flat or minimal cel-shading (two-tone)
- Atmosphere & Depth: flat with depth via overlap only
- Colors: limited palette of 4-6 saturated but slightly muted hues
- Background: solid flat colour ou subtle textured paper
- Imperfections: **Layer 3 light only** (paper grain) ou nenhuma
- Negative Prompt: no photorealism, no 3D render, no realistic shading, no gradients, no line art

**Variação editorial:** sobe a saturation, adiciona um accent colour forte, mantém grain leve.

**Variação corporate:** reduz saturation, paleta de 3-4 cores apenas, sem grain, fundo branco ou neutro.

---

## Lineless indie game vector

O exemplo do PDF Miniclip. Estilo cinematic/fantasy para jogos indie — Monument Valley, Gris, Sky Children of the Light, Stumble Guys-adjacent. Mais ilustrativo que o flat vector limpo.

**Triggers:** "indie game", "estilo Monument Valley", "Gris style", "ilustração indie", "cinematic vector", "fantasy vector", "game art ilustrativo".

**DNA:**
- Style DNA: lineless indie game vector
- Tool: vector pen tool
- Line Behavior: strictly lineless, edges defined by flat colour contrast
- Form Construction: stylised proportions, rounded geometric for characters, sharp geometric for environment
- Physics of Style: clean Bezier with deliberate silhouette
- Surface: subtle gradient allowed in atmospheric backgrounds, flat in character/foreground
- Lighting: minimal flat cel-shading on characters, atmospheric volumetric in background
- Atmosphere & Depth: multi-layered parallax (foreground / midground / background)
- Effects & Glows: localised glows on key shapes, magical wisps, subtle inner glow
- Colors: rich saturated palette, strong focal contrast between warm character and cool environment
- Background: multi-layered silhouettes with mist separating depth planes
- Imperfections: nenhuma
- Negative Prompt: no black outlines, no line art, no realism, no 3D rendering, no rough textures, no photorealism

**Variação dark fantasy:** paleta cool dark blues + cyan glows + purple wisps, mais volumetric fog.

**Variação warm adventure:** paleta warm earth tones + golden glows, less fog mais sunlight.

---

## Watercolour editorial illustration

Registo aguarela editorial — NY Times, The New Yorker, ilustração de revista quality. Soft, contemplativo, hand-made.

**Triggers:** "aguarela", "watercolour", "watercolor", "ilustração editorial pintada", "New Yorker style", "estilo livro", "pintada à mão".

**DNA:**
- Style DNA: watercolour editorial illustration
- Tool: watercolour on cold-press cotton paper
- Line Behavior: optional thin ink line accents on key shapes, or fully lineless
- Form Construction: organic flowing shapes, soft transitions
- Physics of Style: controlled bloom on wet edges, hard pigment edges where paper dried, bleed into cotton fibre, granulation in shadows
- Surface: cold-press cotton paper grain visible throughout
- Lighting: implied soft single source via colour temperature shift
- Atmosphere & Depth: depth via wash density and edge sharpness
- Colors: muted earth palette, occasional vibrant accent (single saturated hue against muted field)
- Background: soft watercolour wash fading to cream paper, or off-white untouched paper
- Imperfections: Layer 3 (paper texture) **on**, Layer 1 light (slight tremor in any line accents)
- Negative Prompt: no photorealism, no digital flatness, no 3D, no vector outlines, no airbrush gradients

**Variação contemplativa:** paleta dessaturada, mais cream paper showing, single muted accent.

**Variação vibrante editorial:** paleta mais saturada, ink line definida, contrast alto.

---

## Risograph two-colour print

Risograph clássico — saturação intensa, registo desalinhado, halftone, 2-3 cores spot. Estilo zine, poster indie, ilustração contemporânea cool.

**Triggers:** "risograph", "riso", "riso print", "zine style", "screenprint", "two-colour print", "duotone print".

**DNA:**
- Style DNA: risograph two-colour print
- Tool: risograph print, spot colour separations
- Line Behavior: depends on artwork — often confident hand-drawn underneath the print process
- Form Construction: simplified bold shapes that read well in spot colour
- Physics of Style: ink saturation varies across the print, slight pooling in solid areas, dry-brush hairlines where ink ran out
- Surface: slightly cream risograph paper stock
- Lighting: implied via colour overlap (where two layers overprint creating a third tone)
- Colors: 2-3 spot colours from the classic riso palette — fluorescent pink + federal blue is the iconic combo; teal + fluorescent orange; black + fluorescent yellow
- Background: solid flat spot colour ou paper showing through
- Imperfections: **Layer 2 essential** (registration shift 3-5px, halftone dots, ink bleed, plate gap), **Layer 3 essential** (paper grain showing)
- Negative Prompt: no photorealism, no 3D, no smooth gradients, no full-colour photography, no clean digital sharpness, no realistic shading

**Variação 90s zine:** mais aggressive registration shift, heavier halftone, paleta black + neon.

**Variação editorial soft:** subtle registration shift, fine halftone only in mid-tones, paleta mais quente.

---

## Cel-shaded anime keyframe

Estilo anime contemporâneo — Studio Ghibli, Makoto Shinkai, Trigger. Cel-shaded com hard edges, paleta saturada, mood específico.

**Triggers:** "anime", "cel-shaded", "Studio Ghibli", "Makoto Shinkai", "anime keyframe", "manga style coloured", "Ghibli style".

**DNA:**
- Style DNA: cel-shaded anime keyframe
- Tool: digital painting with cel-shading layer
- Line Behavior: clean variable-weight ink outline, thicker on outer silhouette, thinner on inner detail
- Form Construction: stylised anime proportions, expressive facial features, detailed environment
- Physics of Style: cel layers stacked with hard edges, no airbrush, occasional gradient in skies only
- Surface: smooth digital
- Lighting: cel-shaded three-tone (light / midtone / shadow) with hard edges, dramatic rim light from primary source
- Atmosphere & Depth: layered backgrounds with atmospheric perspective, painted skies
- Effects & Glows: optical bloom on bright highlights, occasional volumetric god rays
- Colors: rich saturated palette, dramatic colour temperature contrast (warm subject vs cool environment, or vice versa)
- Background: painterly atmospheric environment, more detailed than the character
- Imperfections: nenhuma
- Negative Prompt: no photorealism, no 3D render, no flat vector, no Western cartoon proportions, no airbrush soft shading

**Variação Ghibli soft:** muted warm palette, soft cel-shading com transitions, environment dominates.

**Variação Shinkai dramatic:** high saturation, dramatic sky, intense rim light, painterly clouds.

**Variação Trigger kinetic:** thick variable line, dynamic pose, dramatic effects, high contrast.

---

## Isometric pixel diorama

Pixel art em vista isométrica — Habbo Hotel meets Monument Valley. Dioramas pequenos, charmosos, detalhe denso.

**Triggers:** "isométrico pixel", "isometric pixel", "pixel diorama", "pixel art isometric", "Habbo style", "pixel city".

**DNA:**
- Style DNA: isometric pixel diorama
- Tool: pixel art at 64x64 or 128x128 base resolution, indexed palette
- Line Behavior: hard 1px outlines, occasionally 2px on outer silhouette
- Form Construction: isometric grid 30°/30°/90°, geometric block construction
- Physics of Style: hard 1px edges, no anti-alias, dithering in shadow transitions, indexed colour
- Surface: smooth pixel grid
- Lighting: flat cel-shaded with hard edges, dithered transitions in shadow areas
- Atmosphere & Depth: depth via diminishing detail and palette shift in distance
- Colors: limited indexed palette (16-32 colours), high saturation
- Background: solid colour or simple pixel pattern
- Imperfections: nenhuma (a precisão é parte do estilo)
- Negative Prompt: no anti-aliasing, no smooth gradients, no vector smoothness, no realistic shading, no photographic detail, no perspective distortion

**Variação cosy 16-bit:** paleta SNES-era warm tones, mais detalhe arquitectónico, charm.

**Variação cyberpunk:** paleta neon, dithering pesado, environment denso urbano.

---

## Hand-drawn ink editorial

Ilustração editorial à mão, pen-and-ink, Christoph Niemann conceptual minimal, NY Times spot illustration.

**Triggers:** "Christoph Niemann", "ink editorial", "pen and ink", "ilustração à mão simples", "editorial minimal", "conceptual illustration", "spot illustration".

**DNA:**
- Style DNA: hand-drawn ink conceptual editorial
- Tool: dip pen and india ink, or 0.5mm pigment liner felt pen
- Line Behavior: confident variable-weight ink line, occasional double-pass, mostly clean but with character
- Form Construction: reductive simplified shapes, conceptual not literal
- Physics of Style: pooled ink at stroke starts, slight bleed into paper fibre, dry-brush hairlines where pen ran out
- Surface: hot-press smooth paper, very fine texture
- Lighting: implied via solid black fills as shadow / negative space
- Atmosphere & Depth: flat compositional, no rendered depth
- Colors: high-contrast black ink on cream paper, optional single spot colour accent
- Background: cream paper, untouched
- Imperfections: Layer 1 (hand-drawn imperfections — slight overshoot, pressure variation), Layer 3 light (paper grain)
- Negative Prompt: no photorealism, no rendered shading, no digital flatness, no 3D, no realistic textures, no gradient colour

**Variação conceptual minimal:** very few elements, lots of negative space, single visual metaphor.

**Variação dense crosshatched:** crosshatching for shadow areas, more detail, traditional engraving feel.

---

## Children's book gouache

Ilustração de livro infantil contemporâneo — Oliver Jeffers, Jon Klassen, Beatrice Alemagna. Soft, warm, textured.

**Triggers:** "children's book", "livro infantil", "Oliver Jeffers", "Jon Klassen", "storybook", "ilustração infantil", "picture book style".

**DNA:**
- Style DNA: children's book gouache illustration
- Tool: gouache on hot-press paper, sometimes with collage elements
- Line Behavior: subtle imperfect line, hand-painted edges
- Form Construction: simplified expressive shapes, charming proportions
- Physics of Style: gouache opacity, soft matte finish, slight visible brush strokes, occasional pencil underdrawing visible through
- Surface: hot-press paper grain subtle
- Lighting: implied via colour temperature, not rendered light source
- Colors: muted warm palette, autumnal earth tones, single occasional saturated accent
- Background: textured paper showing through, or simple painted environment
- Imperfections: Layer 1 light (hand-drawn variation), Layer 3 essential (paper texture)
- Negative Prompt: no photorealism, no digital flatness, no 3D, no slick vector, no airbrush gradients

**Variação Klassen muted:** very limited palette, lots of texture, restrained colour.

**Variação Jeffers warm:** warmer palette, more whimsy, charming character.

---

## 1-bit retro pixel

Pixel art em 1 bit (preto e branco puro) ou paletas indexadas extremamente limitadas. Estilo Game Boy, Mac Classic, dithering pesado.

**Triggers:** "1-bit", "Game Boy", "Mac Classic", "monocromático pixel", "old Mac", "retro pixel", "Lucas Pope style", "Obra Dinn".

**DNA:**
- Style DNA: 1-bit pixel art retro
- Tool: pixel art at low resolution (32x32 ou 64x64), strictly 1-bit (black + white) ou 2-bit (4 shades)
- Line Behavior: hard 1px pure black on pure white
- Form Construction: simplified silhouettes reading well at low resolution
- Physics of Style: hard pixel grid, dithering for mid-tones (Bayer pattern, Floyd-Steinberg, or ordered)
- Surface: smooth pixel grid
- Lighting: dithered for shadow / midtone simulation
- Atmosphere & Depth: dithering density variation creates depth
- Colors: pure black + pure white, ou Game Boy 4-shade green palette
- Background: solid white ou solid black, ou patterned dither
- Imperfections: nenhuma (precision é o estilo)
- Negative Prompt: no anti-aliasing, no greyscale gradients (only via dithering), no colour, no realistic shading, no vector smoothness

---

## Modern conceptual minimal

Ilustração editorial moderna minimalista — Malika Favre, Olimpia Zagnoli, Mads Berg. Pop arte limpa, formas geométricas, paleta forte.

**Triggers:** "Malika Favre", "Olimpia Zagnoli", "Mads Berg", "minimal modern", "pop art clean", "ilustração pop minimal", "geometric editorial".

**DNA:**
- Style DNA: modern conceptual minimal illustration
- Tool: vector pen tool with boolean operations
- Line Behavior: strictly lineless, or single accent line where conceptually needed
- Form Construction: bold geometric shapes, high contrast silhouettes, simplified character forms
- Physics of Style: razor-clean Bezier, perfect geometric construction
- Surface: smooth digital flat
- Lighting: flat or single hard shadow direction
- Atmosphere & Depth: flat, depth via overlap and scale only
- Colors: bold saturated palette of 4-6 colours, often with one dominant + accents
- Background: solid flat colour, often a bold saturated hue
- Imperfections: nenhuma
- Negative Prompt: no photorealism, no 3D, no rendered shading, no rough textures, no hand-drawn imperfection, no gradient

---

# Como usar os presets

1. Detecta o trigger no pedido do utilizador.
2. Carrega o DNA do preset correspondente como **base**.
3. Substitui placeholders pelo specifics do brief (subject, action, scene composition).
4. Ajusta o que o brief explicitamente contraria. Se o preset diz "paleta muted" mas o utilizador disse "vibrante", o utilizador ganha.
5. Adiciona componentes que o preset não menciona se forem relevantes para o brief.
6. Constrói o prompt no formato do destino (prosa ou vírgulas).

**Múltiplos triggers:** se o pedido combina dois registos ("aguarela mas com linha de marker grosso"), pega no preset principal e injeta 1 ou 2 elementos do secundário. Não tentes fundir os dois a 50/50 — escolhe um como dominante.

**Sem trigger claro:** usa **Flat geometric vector with grain** como default. É o registo contemporâneo mais consistente e o que cai melhor numa maioria de briefs vagos.
