# examples.md — worked examples

Three full examples, one per mode, with the reasoning. Built from real product-shoot prompts. Use these as calibration for density and structure, not as templates to copy verbatim (the consistency tokens are meant to be copied; the heroes are not).

---

## Example A — ISOLATE

**User:** "isola este anel em fundo preto para usar como referência" (+ reference image of a rose gold ring reading PAPI in pavé diamonds)

**Reasoning:** single object, wants it clean for reuse → ISOLATE. Aperture closed for edge-to-edge sharpness. SUBJECT faithful — only what's in the reference (PAPI openwork, pavé white diamonds, single black diamond accent). Soft wrapping light + contact shadow. RENDER gives the rose gold a lit-edge→recess range so it doesn't read as flat CGI.

```
Recreate the exact ring from the reference image — same design, same materials, same proportions, same diamond placement. The ring is positioned upright at a slight angle to showcase the typography and diamond setting.
Product photograph of the same rose gold diamond ring from the reference image. The word "PAPI" fully visible in openwork design, every bar densely set with pavé white diamonds, single black diamond accent at the top. Polished rose gold band visible in full — the entire ring from left curve to right curve, front face and both sides of the band clearly shown. Centered in frame, pure solid black background.
Shot with 50mm lens at f/8 — the entire ring uniformly sharp, every surface in focus from front to back. Every diamond facet resolved, every prong visible, the polished rose gold surface showing its mirror-like finish across the full circumference.
Soft diffused key light from upper left wrapping the entire ring, igniting specular hits across the diamonds. Secondary soft light from upper right ensuring the far side of the band reads clearly with clean highlights. Faint contact shadow beneath grounding the piece against the black void.
Rose gold deepens from bright copper-pink on lit edges to warm bronze in the recesses. Diamonds read bright and alive with tiny refractions inside each stone.
```
→ Assumi Nano Banana Pro (segura melhor a tipografia "PAPI"); para o colar usa exatamente a mesma linha de câmara e o mesmo bloco de luz para os assets combinarem na cena.

**What makes it work:** the "entire ring from left curve to right curve, front face and both sides" instruction forces the full object into frame — isolate prompts fail when the model crops or hides a side. The closed aperture + "from front to back" guarantees a reusable, fully-sharp asset.

---

## Example B — ASSEMBLE

**User:** "monta uma cena de luxo com o ribeye no centro, o anel PAPI e o colar à volta, e a faca japonesa ao fundo, na mesa de mármore vermelho" (+ isolated assets from previous ISOLATE runs)

**Reasoning:** multiple faithful assets into one environment → ASSEMBLE. LOCK doubles: environment lock + a lock per asset, each named identically to how it was isolated. Aperture opens to f/5.6 for depth. FRAMING promoted to labelled block, each object placed by relative position. Lighting + grain are frozen series tokens.

```
Recreate the exact environment from the reference image — same dark red marble round table with white and black veining, same deep red velvet curtains in the background, same lighting setup, same dark luxurious atmosphere, same reflections on the polished marble surface.
Cinematic film still shot on ARRI ALEXA Mini with Zeiss Master Primes 50mm lens at f/5.6 — razor sharp optics with extreme detail rendering, edge-to-edge crispness. Full frame edge to edge.
A luxury editorial food photograph. A thick raw Boneless Ribeye steak sits at the center of the polished red marble table — dense marbling with thick veins of white fat running through deep red muscle, visible muscle fiber grain on the surface, the fat cap along the edge irregular and natural with rough texture. The cut is thick, about two inches, edges slightly uneven from the butcher's hand. The raw surface has a moist tactile quality — individual muscle striations, the fat soft and creamy against the wet bright red meat.
FRAMING — follow exactly:
Camera at table height, slight downward angle looking across the marble surface. The steak commands the center. The rose gold diamond PAPI ring sits in the foreground left, catching sharp specular highlights on the diamonds. A diamond tennis necklace with teardrop pendant drapes loosely around the base of the steak on the marble. A Japanese chef's knife with burl wood handle and damascus steel blade rests diagonally in the background right, blade catching a thin line of light. The polished marble surface reflects every object — steak, jewelry, knife — as dark mirrored doubles beneath them. Deep red velvet curtains fill the background, falling into heavy darkness at the edges and top of frame.
LIGHTING:
Heavy darkness fills the upper frame and corners — the ceiling is a black void. A focused warm key light from upper left rakes across the table surface at a low angle, igniting the marble's polish and the wet sheen on the raw meat. The light catches every diamond on the ring and necklace as sharp pinpoint specular hits. The knife blade reads as a thin bright edge. Strong falloff — the light dies before reaching the curtains, which sit in deep rich shadow, barely readable as fabric folds.
Sharp, detailed film grain.
```
→ Os quatro tokens de série (câmara, environment lock, bloco de luz, grão) ficam congelados; para o próximo shot troca só o herói e o bloco FRAMING.

**What makes it work:** every asset carries its own LOCK named exactly as isolated ("the rose gold diamond PAPI ring", not "the gold ring"). The reflection sentence grounds all objects on the surface at once. The labelled FRAMING block with explicit positions stops the model from piling everything in the center.

---

## Example C — REFRAME

**User:** "pega nesta imagem e mostra-ma vista de cima, top-down, mantendo tudo igual" (+ the assembled scene from Example B)

**Reasoning:** existing image, change only the angle → REFRAME. Restrictive language throughout — "change ONLY", "keep every". The negation block carries the angle (the hardest part: eye-level → strict top-down). Reconstruction license lets the model build the tops it couldn't see. Style lock freezes the look. Restatement closes.

```
Edit the provided image — change ONLY the camera angle and framing. Recreate this exact same scene shot from a strict perpendicular top-down view at exactly 90 degrees, with the camera positioned directly above and looking straight down onto the surface — a flat lay / overhead / bird's-eye perspective with zero tilt. The surface must read as completely flat against the image plane, every object seen from directly above showing only its top, with NO front face visible, NO side visible, NO three-quarter angle, NO perspective distortion, NO vanishing point — pure orthographic top view.
Frame as a tight close-up on the main objects arranged on the surface — every key element from the original image included and clearly visible from directly above, filling the frame together as a tight overhead arrangement. No single object dominates alone; all main elements share the frame. The surface around them is visible only as much as needed to ground the composition.
Keep every subject, object, prop, material and element from the original image present in the new top-down close-up view. Reposition them naturally as they would rest on the surface when seen from directly above. Reconstruct the tops of each object and the surface details around them using the materials, colors, textures and details already established in the original image — extending them logically.
Keep the same lighting source direction, same light quality, same color temperature, same color palette, same overall mood, same atmosphere, same film look, same texture, same grain, same resolution, same image quality, same photographic style, same depth of field feel. Shadows now cast outward from each object across the surface as expected from a top-down light setup.
The final image must read as the exact same scene captured from a strict 90-degree bird's-eye flat-lay camera position, framed tight on all the main elements together — only the angle and the close-up framing change.
```
→ Top-down a partir de uma imagem ao nível da mesa é o reframe mais difícil; se o modelo devolver um três-quartos, reforça com "the surface completely flat against the image plane, zero tilt" e gera 2-3 vezes.

**What makes it work:** the negation list does the heavy lifting — five explicit forbids define the orthographic view far better than any positive description. "Reconstruct the tops... extending them logically" gives explicit permission to invent the newly-visible surfaces, which the model won't do without being told. The long style-lock sentence is what stops a full re-render.

---

## Cross-mode notes

- **ISOLATE feeds ASSEMBLE feeds REFRAME.** The natural pipeline: isolate each asset clean → assemble into a scene → reframe the scene to alternate angles. The LOCK names and consistency tokens established in step 1 carry all the way through.
- **The hero changes, the world doesn't.** Across a food series (ribeye → tomahawks → porterhouse → wagyu strip → filet), only the SUBJECT block and FRAMING change. Environment lock, camera, lighting, grain stay frozen. That discipline is what makes a 10-image set look like one commissioned shoot.
- **When a REFRAME must hide the set** (e.g. top-down that shouldn't show the round table or curtains), use the "infinite floor" framing: `the polished marble surface extends beyond every edge of the frame in all directions, as if shooting on an infinite marble floor; the table shape, edges, curtains and background completely outside the frame.`
