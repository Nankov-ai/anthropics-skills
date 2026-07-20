# components.md

Vocabulary for building illustration prompts. Pick the components that matter for the brief — never fill all of them. Typical advanced prompt uses 10 to 16. Mínimo útil: 8.

Components are organised into three internal stages:
- **SIMULATE** (how it's drawn): Tool, Line Behavior, Form Construction, Physics of Style
- **RENDER** (how it's lit and finished): Surface, Lighting, Atmosphere & Depth, Effects & Glows, Imperfections
- **LOOK** (how it reads): Subject, Action / Pose, Scene Composition, Reduction Level, Mood, Style DNA, Colors, Background, Negative Prompt

This structure is for **internal thinking only**. Never expose the stage names as section headers in the output — the output is plain prose or comma-separated keywords.

To avoid confusion: this file uses "stage" for the SIMULATE / RENDER / LOOK groupings, and "layer" exclusively for the four **imperfection layers** documented near the end of this file.

---

# STAGE — SIMULATE

How the illustration is constructed at the mark-making level.

---

## 1. Tool

The virtual instrument used to create the illustration. Sets the rules for line, surface, and finish.

**When to use:** always — second only to Style DNA in importance.
**When to skip:** never.

**Examples by category:**

*Vector / digital flat:*
- Vector pen tool (Illustrator Bezier paths)
- Vector with boolean operations (combined / subtracted shapes)
- Blob brush vector
- Flat digital fills with anti-aliased edges
- SVG-style geometric construction

*Hand-drawn analog:*
- 0.5mm pigment liner felt pen (Sakura Micron, Staedtler Pigment)
- Ballpoint pen on paper (Bic, varied pressure)
- Pencil sketch, HB graphite
- Mechanical pencil 0.5mm, clean lines
- Charcoal stick on rough paper
- Brush pen with variable line (Pentel Pocket Brush, Kuretake Bimoji)
- Copic marker (controlled bleed, alcohol-based, smooth blending)
- Posca paint marker (opaque, no bleed, matte finish)
- Sharpie marker (aggressive bleed, saturated, slight feathering on edges)
- Tombow brush marker (water-based, soft bleed)
- Dip pen and india ink
- Quill pen with iron gall ink

*Painted:*
- Watercolour on cold-press cotton paper
- Gouache on hot-press paper
- Oil paint with palette knife
- Acrylic on canvas
- Digital painting emulating oil
- Ink wash, sumi-e brush

*Print-based:*
- Risograph two-colour print
- Screenprint with halftone separations
- Linocut woodcut block print
- Letterpress relief
- Etching with crosshatched shading

*Pixel / retro digital:*
- 1-bit pixel art at 32x32 resolution
- 16-bit JRPG pixel art
- Aseprite-style indexed colour pixel
- Dithered EGA palette

*3D-stylised:*
- Toon-shaded 3D render
- Low-poly geometric 3D
- Voxel art

**Combination note:** the tool dictates much of what follows. Watercolour wants bloom and bleed. Vector wants Bezier cleanness. Marker wants saturated bleed and pressure variation.

---

## 2. Line Behavior

How the line itself behaves. Single highest-leverage component for hand-drawn looks.

**When to use:** always for line-based styles. Skip only for strictly lineless work (and even then, specify "strictly lineless").

**Examples:**

*Clean / geometric:*
- Thin solid outlines, consistent 1pt weight
- Strictly lineless — no outlines, shapes defined by colour contrast only
- Clean Bezier curves, perfectly smooth
- Monoline weight throughout
- Variable but controlled stroke (thick on outer, thin on inner)

*Hand / organic:*
- Thin shaky line with natural jitter
- Confident loose ink line, mid-weight
- Thick expressive brush stroke, weight varies with pressure
- Sketchy line with multiple passes, no single "correct" stroke
- Overshooting lines past corners
- Open strokes that don't fully close at junctions
- Bouncing line weight, ranging from hair-thin to bold

*Stylised:*
- Tapered ends on every line
- Heavy stroke on outer silhouette, thin on inner details
- Broken / dashed outlines
- Hatching for shadow areas only

**Combination note:** Match line behavior to tool. Vector pen + shaky line = wrong. Marker + perfect monoline = wrong. The line should look like the tool actually made it.

---

## 3. Form Construction

How shapes are built and combined.

**When to use:** when the geometric character of the image matters (most cases).
**When to skip:** painterly work where forms blend rather than construct.

**Examples:**

*Geometric:*
- Perfect geometric primitives (circles, squares, triangles)
- Angular polygons with sharp corners
- Constructed from boolean operations on basic shapes
- Isometric grid construction, 30° / 30° / 90°
- Rounded geometric (geometry with consistent corner radius)

*Organic:*
- Organic blobs, no straight edges
- Bulbous balloon-like forms
- Flowing curves built from few control points
- Tapered organic shapes

*Stylised proportions:*
- Exaggerated geometric shapes, oversized heads, simplified bodies
- Stocky proportions, low-resolution silhouettes
- Elongated stylised proportions
- Chibi / kawaii proportions (2.5 heads tall)

*Construction logic:*
- Constructed from few large shapes (silhouette-first)
- Built up from many small shapes (mosaic-like)
- Layered cut-paper construction
- Symbolic / iconic reduction

---

## 4. Physics of Style

How the chosen tool actually behaves on its chosen surface. This is the single component that separates good illustration prompts from generic ones. Always describe physics when you specify a tool.

**When to use:** always when a tool is specified.
**When to skip:** never if you have a tool. If you skip this, the prompt is weak.

**Examples by tool family:**

*Watercolour physics:*
- Controlled bloom on wet edges, slight halo
- Hard pigment edges where paper dried
- Bleed into the cotton fibre
- Granulation in the shadow areas (pigment settling unevenly)
- Lifting in the highlights (areas where colour was pulled back)
- Cauliflower texture where wet meets damp

*Marker / felt pen physics:*
- Visible streak marks from overlapping strokes
- Bleed-through from the underside showing
- Saturated where ink pooled, lighter where pen lifted
- Pressure variation creating thicker / thinner segments
- Slight bleed past the intended edge

*Vector physics:*
- Razor-clean Bezier edges, no anti-alias artefacts
- Perfectly closed shapes, no gaps
- Smooth path joins with no kinks
- Consistent corner radius across forms

*Pencil / graphite physics:*
- Visible graphite particles in the paper grain
- Smudging where the hand passed
- Shine on the heaviest dark areas
- Light areas with the paper texture coming through

*Ink physics:*
- Pooled ink at the start of strokes
- Slight bleed into the paper fibre at line edges
- Dry-brush hairlines where the pen ran out
- Splatter from quick gestures

*Pixel art physics:*
- Hard 1px edges, no anti-alias
- Dithering in transition zones
- Pure indexed colours, no in-between hues
- Stair-stepped diagonals

*Print physics (risograph / screenprint):*
- Slight registration shift between colour layers
- Halftone dots in mid-tones
- Solid blocks of spot colour with no gradient
- Ink saturation varies across the print run

---

# STAGE — RENDER

How the illustration is lit, textured, and finished.

---

## 5. Surface

Texture and finish of the final image.

**When to use:** almost always.
**When to skip:** clean digital flat where the surface is "smooth screen" by default.

**Examples by surface character:**

*Clean / smooth:*
- Smooth digital flat, no texture
- Glossy 3D plastic surface
- Matte digital, no grain

*Print-textured:*
- Heavy noise grain overlay, retro print feel
- Light film grain, subtle
- Halftone dots (fine / medium / coarse)
- Newsprint absorption, slightly muddy
- Risograph paper stock, slightly cream

*Paper-textured:*
- Cold-press cotton paper grain
- Hot-press smooth paper
- Rough canvas weave
- Matte paper texture
- Recycled paper with visible fibres

*Aged / distressed:*
- Vintage 1970s found-print feel — yellowed paper, fade at the edges
- Aged poster — tape marks visible in the corners, fold creases through the middle
- Bleached areas where light bleached the paper unevenly
- Water-stained edges, tide-mark rings
- Coffee-stained, organic warm browning
- Distressed punk zine — photocopy degradation, high-contrast burnout
- Archaeological aged — heavy yellowing, brittle edges, foxing spots
- Faded UV-bleached colours, especially in the warm spectrum
- Slight warping and pulpy texture

**Combination note:** Aged / distressed effects work best with **Layer 3 (paper texture) on** and often **Layer 2 (print registration)** for printed media that's aged. Don't apply aged effects to inherently clean styles (flat modern vector) — the visual contradiction breaks the prompt.

---

## 6. Lighting

How light is treated in the illustration. In illustration this is rules, not physics.

**When to use:** almost always.
**When to skip:** strictly flat 2D where light is implied or absent.

**Examples:**

- Flat shading, no light source implied
- Cel-shaded with hard edges, two-tone (light / shadow)
- Cel-shaded three-tone (light / midtone / shadow)
- Plastic cel shading, glossy highlights
- Soft cel-shading with gradient edges
- Volumetric god rays through atmosphere
- Long stylised shadows from a single source
- Rim lighting on the silhouette edge
- Glowing self-lit forms (no external source)
- Chiaroscuro hard light / deep shadow contrast
- Subsurface scattering glow on warm forms
- Ambient occlusion in the cracks

---

## 7. Atmosphere & Depth

How the illustration creates spatial depth.

**When to use:** scenes with environments or multiple depth planes.
**When to skip:** flat icons, single-subject portraits on solid background.

**Examples:**

- Flat with no depth, all elements on one plane
- Multi-layered parallax (foreground / midground / background separation)
- Dense volumetric fog separating layers
- Aerial perspective: distant elements cooler and lighter
- Atmospheric haze in the background
- Sharp foreground, blurred background
- Crisp throughout, depth only via overlap
- Receding planes with diminishing detail

---

## 8. Effects & Glows

Light effects beyond standard lighting. Optional polish.

**When to use:** when the brief calls for energy, magic, sci-fi, dramatic mood.
**When to skip:** quiet editorial, flat clean styles, realistic mid-range scenes.

**Examples:**

- None
- Localised glow halos around bright shapes
- Optical bloom on the brightest areas
- Sparks and floating wisps
- Energy auras around characters
- Subtle inner glow on key shapes
- Volumetric light beams through windows
- Particle effects: dust, snow, embers
- Magic wisps with trailing fade
- Lens flare (stylised, not photographic)

---

## 9. Imperfections

How "errors" are intentionally introduced. See the **four imperfection layers** at the bottom of this file for the detailed system.

**When to use:** when you want the illustration to feel hand-made, printed, or to have texture beyond clean digital.
**When to skip:** clean modern digital aesthetics, corporate flat design, ultra-precise vector.

**Brief mention here, full system below:**
- Hand-drawn imperfections (Layer 1 below)
- Print & registration artifacts (Layer 2 below)
- Paper & surface texture (Layer 3 below)
- Digital intentional errors (Layer 4 below)

---

# STAGE — LOOK

How the illustration reads — what's in it, how it's composed, how it's coloured.

---

## 10. Subject

What or who appears in the image. The anchor of the whole prompt.

**When to use:** always.
**When to skip:** never.

**Examples:**
- A young adventurer character with a backpack
- An elderly wizard mid-incantation
- A small fox curled up sleeping
- A weathered medieval knight
- An abstract geometric shape composition
- A modern city skyline at sunset
- A diagonal cross-section of an apartment building
- A nondescript everyday object (kettle, chair, lamp)
- A stylised dragon coiled around a tower

**Notes on specificity for illustration:** unlike photography, illustration can have stylised, exaggerated, or fantastical subjects. Don't worry about real-world plausibility — worry about visual readability.

---

## 11. Action / Pose

What the subject is doing and how the body holds itself. For character illustration this is one of the highest-leverage components — pose carries half the storytelling.

**When to use:** any subject with a body or implied motion.
**When to skip:** abstract shapes, static objects, landscapes.

**Examples by pose dimension:**

*Action (what the subject is doing):*
- Standing still, neutral
- Mid-jump, arms raised
- Drawing a bow, focused on a distant target
- Casting a spell with hands glowing
- Walking toward camera, confident gait
- Curled up sleeping, head tucked
- Sitting cross-legged, reading
- Mid-incantation, eyes closed, energy swirling

*Stance / weight (contrapposto):*
- Contrapposto stance — weight shifted onto one leg, hips and shoulders counter-rotated
- Symmetric stance — weight even on both legs, frontal
- Off-balance stance — weight on the back foot, gesture forward
- Stable rooted stance — wide base, low centre of gravity
- Coiled stance — weight loaded, ready to release

*Line of action:*
- Strong vertical line of action (stillness, dignity)
- Curving S-line of action (grace, flow)
- Diagonal line of action (kinetic energy, instability)
- Coiled C-curve line of action (tension, anticipation)

*Viewing angle:*
- Pure frontal view
- Pure profile (direct side view)
- Three-quarter front view
- Three-quarter back view
- Pure back view
- Slight over-the-shoulder

*Foreshortening:*
- Severe foreshortening, hand reaching toward viewer
- Mild foreshortening, slight depth compression
- No foreshortening, parallel to picture plane
- Foreshortening on the receding leg

*Gesture quality:*
- Confident clean gesture, bold silhouette
- Soft tentative gesture, narrow silhouette
- Asymmetric posing — body weight off-centre for tension
- Centred symmetric pose — formal, iconic

**Combination note:** for character illustration, match pose to mood. A "confident standing" pose with a "melancholic" mood produces tension; a "running" pose with a "static composition" feels wrong. The pose has to match the storytelling.

**Silhouette readability rule:** the pose must read as a silhouette. If you painted the figure pure black, the action should still be readable. When in doubt, choose poses with bold silhouettes over poses with arms tucked tight against the body.

---

## 12. Scene Composition

How elements are arranged in the frame. Composition is a discipline — bring the vocabulary, not just "foreground / midground / background".

**When to use:** always. Every illustration has composition, even single-subject portraits.
**When to skip:** never.

**Examples by compositional dimension:**

*Compositional rules:*
- Rule of thirds — subject placed on a third-line intersection
- Rule of odds — three subjects, never two
- Golden spiral — composition spirals from corner to focal point
- Centred symmetric — subject dead-centre, formal iconic feel
- Off-centre asymmetric — subject pushed to one side, tension

*Eye-path control:*
- Strong leading line from lower-left to upper-right
- Z-pattern reading — eye enters top-left, sweeps right, drops, sweeps right again
- F-pattern reading — vertical scan with horizontal branches
- Circular eye-path returning to the focal point
- Eye trapped in centre by inward-facing elements

*Negative space:*
- Negative space as protagonist — subject small, vast empty space dominates
- Tight negative space — subject fills the frame, breathing room minimal
- Balanced negative space — subject and space roughly equal weight
- Asymmetric negative space — subject offset, empty space directs the gaze

*Cropping / framing strategy:*
- Subject cropped at the shoulders (portrait crop)
- Subject cropped at the waist (medium crop)
- Subject cropped mid-action (dynamic crop, e.g., elbow cut off mid-gesture)
- Subject bleeding off multiple edges (immersive, dense)
- Full subject visible, contained within frame with margin
- Vignette crop — subject cropped tightly with intentional edge tension

*Spatial layering:*
- Single depth plane — flat compositional, no recession
- Foreground / midground / background — three layers separated by overlap or atmosphere
- Multi-layered parallax — five or more depth planes for cinematic depth
- Isometric grid layout — elements arranged on 30°/30°/90° axis
- Cross-section view — interior revealed by cutting through

*Dynamic compositions:*
- Diagonal composition — motion from lower-left to upper-right
- Radial composition — elements explode outward from a central point
- Pyramidal composition — stable triangle with subject at apex
- Spiral composition — elements rotate around a central focus

*Editorial / conceptual compositions:*
- Single hero element with floating supporting icons
- Conceptual collage — disparate symbols arranged as a visual essay
- Subject framed by environmental elements (frame within frame)
- Negative space holding a visual metaphor

**Tangent avoidance:** when two shapes' edges touch or just barely overlap, the composition feels accidental. Pose elements so they either clearly overlap with depth, or clearly don't touch. State this explicitly when the brief involves multiple subjects or props.

**Visual weight rule:** large + saturated + high-contrast = heavy. Balance heavy elements against open space or multiple lighter elements. State the balance intent explicitly in the prompt.

---

## 12b. Reduction Level / Detail Density

How much detail the illustration contains. This is a critical decision that's invisible by default — without stating it, the model lands on "moderate detail" which is rarely what you want.

**When to use:** always. Every illustration sits somewhere on this spectrum.
**When to skip:** never.

**The spectrum:**

*Iconic minimalism:*
- Reduced to essential symbolic elements only
- Subject expressed in 3-5 shapes total
- Vast negative space, single visual metaphor
- Conceptual minimal, one idea per image
- Pictogram-level reduction

*Light detail:*
- Clean geometric simplification
- Basic features defined, no internal texture
- 5-15 distinct elements in the composition
- Editorial spot-illustration density

*Moderate detail:*
- Standard editorial illustration density
- Features defined, key textures suggested
- 15-30 distinct elements
- Picture book interior page density

*Highly detailed illustrative:*
- Dense composition, every area resolved
- Textures, patterns, secondary elements visible
- Picture book cover or full spread density
- Game key art density

*Maximalist:*
- Every centimetre carries something
- Multiple secondary narratives within the frame
- Bosch-density or James Jean density
- Reward for close inspection
- Visual feast, almost overwhelming

**Combination note:** Reduction level interacts with Style DNA. "Flat geometric vector" naturally lives in light-to-moderate detail. "Risograph" can go from iconic to maximalist. "Children's book gouache" defaults to moderate-to-detailed. State the level explicitly when it differs from the style's default.

---

## 12c. Mood / Emotion

The emotional register the illustration should evoke. Distinct from Lighting (which is the *mechanism*) and Colors (which is the *palette*). Mood is the *feeling*.

**When to use:** always for narrative or character illustration. Skip only for technical / informational illustrations where mood is neutral.

**Examples:**

*Quiet moods:*
- Contemplative, still, suspended in time
- Melancholic, soft, unresolved
- Intimate, gentle, hand-on-heart
- Wistful, nostalgic, faded

*Energetic moods:*
- Joyful, candid, unstaged
- Kinetic, dynamic, bursting
- Triumphant, expansive, hopeful
- Mischievous, playful, light

*Tense moods:*
- Ominous, foreboding, just-before
- Tense, restrained, coiled
- Eerie, uncanny, off-key
- Oppressive, heavy, claustrophobic

*Surreal / strange:*
- Dreamlike, hallucinatory, floating
- Whimsical, fantastical, charmingly absurd
- Surreal, dream-logic, impossible
- Magical-realist, grounded but otherworldly

*Stoic / formal:*
- Reverent, solemn, ceremonial
- Stoic, dignified, monumental
- Mundane, ordinary, unremarkable (intentional)

**Notes:** stack 2-3 mood words for nuance. "Sad" is weak. "Melancholic, suspended, quietly hopeful" gives the model emotional texture to resolve ambiguous decisions in your favour.

---

## 13. Style DNA

The three-word summary of the visual genre. This is the **most leveraged single phrase** in the whole prompt. Spend time on it.

**When to use:** always. Lead with this for prose models, lead with this for Midjourney too.

**Examples (style descriptions, not author names — author references stay in `presets.md` as triggers only):**
- Flat geometric vector
- Lineless indie game vector
- Watercolour editorial illustration
- Risograph two-colour print
- Hand-drawn ink editorial
- Cel-shaded anime keyframe
- Isometric pixel diorama
- 1-bit pixel art retro
- Children's book gouache
- Modern flat with grain
- Brutalist collage editorial
- Soft pastel storybook
- Cyberpunk neon vector
- Warm Japanese animation watercolour
- 2000s Saturday-morning cartoon flat
- Mid-century modern poster
- Constructivist bold poster
- Bauhaus geometric abstract
- Mid-century cut-paper graphic
- Conceptual minimal single-image editorial
- Aged found gig poster
- European editorial picture book

**Combination note:** the Style DNA dictates which other components are even relevant. "Flat geometric vector" never wants watercolour bloom. "Watercolour editorial" never wants Bezier perfection.

**Important:** the Style DNA goes into the **output prompt**. Author and studio names should not appear in the output (rights and identity reasons, plus they make prompts brittle when models update). Use the descriptive equivalent. The author trigger (e.g., "Niemann style") is for **detecting which preset to load** in `presets.md` — not for inclusion in the final prompt.

---

## 14. Colors

Colour rules and palette.

**When to use:** always.
**When to skip:** never.

**Examples:**

*Saturation rules:*
- Highly saturated, candy-pop palette
- Muted pastels throughout
- Desaturated earth tones
- Monochrome with a single accent colour
- Bichromatic two-colour spot
- Polychromatic, limited 5-colour palette

*Palette specifics:*
- Strict hex palette: #1a1a2e, #f5f5dc, #c0392b, #16a085
- Moody cool palette: deep navy, slate grey, accent amber
- Warm earth tones: terracotta, cream, burnt sienna, olive
- Cyberpunk neon: electric magenta, cyan, deep purple
- Risograph palette: fluorescent pink, federal blue, soft yellow
- Soft pastels: dusty rose, sage, butter yellow, soft lavender
- High-contrast: pure black, pure white, single saturated red

*Treatments:*
- Black and white with a single accent
- Sepia-toned monochrome
- Faded vintage palette, cream highlights
- Bold colour-blocking, no gradients
- Limited dithered palette (8 colours total)

---

## 15. Background

How the background is treated.

**When to use:** always.
**When to skip:** never — even "transparent" or "solid white" is a deliberate choice worth stating.

**Examples:**
- Solid flat colour (specify which)
- Transparent background (for stickers / cutouts)
- Gradient sky, warm to cool
- Textured paper background, slightly off-white
- Multi-layered silhouette background (distant mountains, mid hills, near trees)
- Detailed environment matching the subject style
- Soft watercolour wash fading to cream
- Subtle pattern (dots, grid, hatching)
- Abstract geometric shapes complementing the subject
- Cinematic atmospheric environment with parallax depth

---

## 16. Negative Prompt / AVOID

What to explicitly exclude. Almost every illustration benefits from this — it tells the model what *not* to drift toward.

**When to use:** almost always for illustration. Especially important when the style is far from the model's default (which is photorealism).
**When to skip:** rarely. Only if the brief is extremely tight and the medium anchor at the start is already doing the job.

**Default exclusions by style (use these as starting points, not as rigid rules):**

*For flat vector / lineless:*
- no photorealism, no 3D render, no realistic shading, no gradients beyond intentional cel-shading, no detailed textures, no line art

*For hand-drawn / watercolour:*
- no photorealism, no digital flatness, no 3D, no vector outlines, no airbrush gradients

*For pixel art:*
- no anti-aliasing, no smooth gradients, no realistic shading, no photographic detail, no vector smoothness

*For risograph:*
- no photorealism, no 3D, no smooth airbrush gradients, no full-colour photography, no realistic shading

*For isometric:*
- no perspective distortion, no photorealism, no realistic shading, no organic curves on architecture (unless intentional)

*For pen-and-ink / line-based:*
- no photorealism, no 3D, no rendered shading, no colour fills (unless explicitly added), no airbrush

*For aged / vintage poster:*
- no clean digital sharpness, no modern flat aesthetic, no pristine surfaces

*Universal anti-drift (almost always add at least one):*
- no photorealism
- no 3D render
- no photographic detail

**Composition rule:** the AVOID list should be the **opposite** of what your style is. If your style is highly textured, don't put "no texture" — that's confusing the model. The negative prompt protects the style from defaults the model would otherwise drift to. If your style is risograph, the AVOID list excludes clean digital and photorealism. If your style is hand-drawn, the AVOID list excludes vector cleanness.

**Length rule:** 4-7 exclusions is the sweet spot. More than 10 dilutes the signal.

---

# Imperfection layers

The four layers below are **independent**. Activate the ones that fit the style brief. Never default to all four — most clean styles use one or none, hand-made styles use two or three.

When to activate (general principle):
- Style asks for "hand-made", "printed", "vintage", "rough", "analog" → activate one or more
- Style asks for "clean", "flat", "modern", "polished", "minimal" → activate none or only Layer 3 lightly

---

## Layer 1 — Hand-drawn imperfections (linha humana)

Targets the natural variability of a human hand drawing. Use for styles that should look hand-made, not digitally pristine.

**Examples:**
- Overshooting lines past corners and intersections
- Pressure variation creating thicker and thinner segments
- Slight tremor / jitter in the line
- Open strokes that don't fully close at junctions
- Double-pass on confident strokes, slight ghosting
- Sketch lines visible underneath the final ink
- Construction marks not fully erased
- Uneven hatching density in shadow areas
- Confidently asymmetric where machine precision would mirror
- Visible eraser marks lifting tone

**Skip when:** vector clean styles, modern flat, geometric precision.

**Dosage:** pick 2-3 specifics, not all. Stacking everything makes the illustration look amateur rather than hand-made-with-craft.

---

## Layer 2 — Print & registration artifacts

Targets the mechanical errors of physical print processes. Use for risograph, screenprint, offset, letterpress, newspaper-style aesthetics.

**Examples:**
- Slight registration shift between colour layers (3-5px offset)
- Halftone dots in mid-tones (fine / medium / coarse)
- Ink bleed at the edges of solid colour blocks
- Plate gap (a sliver of white between adjacent colours)
- Ghosting from previous print impressions
- Over-saturated ink pooling in solid areas
- Under-saturated patches from uneven ink coverage
- Trapping (deliberate colour overlap to hide gaps)
- Moiré pattern from overlapping halftones
- Edge wear / fade on long print runs

**Skip when:** clean digital, hand-drawn analog (which has Layer 1 instead), modern flat vector.

**Dosage:** one or two specifics. Registration shift + halftone is the classic risograph combo and is usually enough.

---

## Layer 3 — Paper & surface texture

Targets the substrate the illustration sits on. Use for any style that wants to feel physical rather than screen-native.

**Examples:**
- Cold-press cotton paper grain visible through colour
- Hot-press smooth paper, very fine texture
- Rough watercolour paper, dimples visible
- Newsprint absorption, slight muddy edges
- Cream / off-white paper stock, slightly aged
- Deckled (rough torn) paper edges
- Watercolour bloom where pigment pooled on wet paper
- Ink absorption into paper fibre
- Slight paper warping at the edges
- Tape marks where the paper was held down
- Subtle paper fibre texture in the shadows
- Embossed pulpy texture

**Skip when:** strictly digital styles (modern flat, vector, pixel art, 3D).

**Dosage:** one specific is usually enough. "Cold-press cotton paper grain visible throughout" is a complete statement on its own.

---

## Layer 4 — Digital "errors" intentional

Targets glitches, aberrations, and digital artefacts deliberately introduced for stylistic effect. Use for cyberpunk, glitch art, lo-fi digital, vapourwave, retro digital.

**Examples:**
- Chromatic aberration on high-contrast edges (RGB separation)
- Glitch displacement bands across the image
- Horizontal scan lines, CRT-style
- Intentional JPEG block artefacts
- Posterization to 8 or 16 colours
- Dithering pattern in the transition zones
- Pixel sorting on a defined region
- VHS tracking lines and colour bleed
- Datamoshing distortion
- Cathode ray tube curvature and vignette

**Skip when:** hand-drawn analog, watercolour, fine art, anything trying to feel physical or organic.

**Dosage:** one effect well-applied beats four stacked. Chromatic aberration alone often does the whole job.

---

# Canonical combinations → see `presets.md`

The full set of established aesthetic DNAs (Flat geometric vector with grain, Lineless indie game vector, Watercolour editorial, Risograph two-colour, Cel-shaded anime, Isometric pixel diorama, Hand-drawn ink editorial, Children's book gouache, 1-bit retro pixel, Modern conceptual minimal) lives in `references/presets.md`. That file is the single source of truth for preset combinations — consult it when the brief signals a named aesthetic, or when defaulting to "Flat geometric vector with grain" on ambiguous briefs.

This file (`components.md`) is the **vocabulary**. `presets.md` is the **starting recipes**. Use both together: presets give a base, components let you adapt.
