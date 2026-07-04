---
name: visual-content-transformer
description: >
  Transform any existing content into a professional visual using AI image generation tools
  (ChatGPT, Gemini, Copilot). Use this skill whenever the user has content that needs to
  become a visual — even if they don't use words like "infographic" or "design". Trigger on:
  "quero apresentar isto de forma visual", "transforma este documento", "cria um cartaz com
  este conteúdo", "tens uma forma de mostrar estes dados?", "quero renovar esta imagem antiga",
  "edita esta fotografia", "anima este esboço", "banda desenhada", "dashboard dos dados do
  questionário", "cartaz com o meu avatar", or any request where the user has existing material
  (text, data, photo, PDF, sketch, old infographic) and wants a visual output.
  Also trigger proactively when a user shares a document or dataset and asks how to present
  it to an audience — visual transformation is almost always the right answer.
  Does NOT cover creating visuals from scratch with no input — see canvas-design for that.
  Does NOT cover video — see ai-video-creator for that.
---

# Visual Content Transformer

## Core idea

The user has something that exists (text, data, a photo, a sketch, an old image).
The goal is to turn it into something visual and professional — without the user
needing to know design tools.

The AI does not invent content — it transforms what you give it.
**Always ask the user to attach the source material** before generating the prompt.

---

## Strategy selector — pick by what the user has

| User has | User wants | Strategy |
|---|---|---|
| Forum/discussion posts | Synthesis infographic | 1 |
| Survey data (Excel/CSV) | Visual dashboard | 2 |
| Complex instructions or brief | Roadmap / flowchart | 3 |
| Written feedback per person | Learning poster with avatars | 4 |
| Long PDF or study | Sequence of slide images | 5 |
| Existing infographic to refresh | 4 style options to choose from | 6 |
| Photo to edit | Background swap / avatar / 3D | 7 |
| Story or dialogue text | Comic strip | 8 |
| Old/weak diagram or scheme | Modern redesign | 9 |
| Topic content + personal photo | Presenter poster with avatar | 10 |
| Template you like + your text | Text swapped into template | 11 |
| Hand sketch or whiteboard photo | Clean digital diagram | 12 |

---

## The 12 strategies with prompts

### 1. Forum voices → Infographic

Use when the user has text contributions from multiple people (forum, chat, survey answers)
and wants a single image that synthesises everyone's input.
Privacy matters here: neutral IDs protect participants and make the output usable publicly.

```
Analisa o ficheiro em anexo com intervenções e reflexões de [alunos/equipa] no fórum.
Não uses nomes completos, atribui a cada participante uma identificação neutra:
pessoa 1, pessoa 2, pessoa 3, etc.
Para cada pessoa, extrai uma ideia curta fiel ao sentido original com valor [pedagógico/estratégico].
Depois cria um infográfico em português de Portugal com o título "[título]".
Usa uma composição vertical 4x5, visual moderno, claro e profissional
com uma silhueta ou ícone discreto para cada pessoa.
Hierarquia visual forte, pouco texto, boa legibilidade, cores harmoniosas.
Coloca o meu nome no rodapé.
Não inventes opiniões, usa apenas o conteúdo fornecido.
```

---

### 2. Survey data → Visual dashboard

Use when the user has quantitative results (questionnaire, NPS, assessment) and needs
a visual that lets an audience grasp the findings at a glance — without reading a report.

```
Analisa o ficheiro em anexo com respostas de um questionário.
Cria um dashboard visual em português de Portugal com as principais conclusões,
combinando cartões de indicadores, gráficos simples e uma síntese interpretativa objetiva.
O dashboard deve permitir uma leitura rápida: padrões dominantes, aspetos críticos,
tendências e possíveis implicações [pedagógicas/estratégicas/operacionais].
Usa um estilo profissional, limpo e contemporâneo.
Evita excesso de texto e não transformes interpretações em certezas absolutas.
```

---

### 3. Activity/instructions → Visual roadmap

Use when a process, brief, or set of instructions is complex in text form but would be
immediately clear as a visual sequence. The AI chooses the best format (roadmap,
flowchart, mind map) based on the structure of the content.

```
Transforma as instruções em anexo num recurso visual claro.
O objetivo é tornar a tarefa mais simples, direta e acionável.
Cria primeiro uma síntese com um objetivo principal e depois organiza
os procedimentos num mapa visual com etapas sequenciais.
Podes usar o formato de roadmap, fluxograma ou mapa mental,
escolhendo o mais adequado à clareza da atividade.
Usa português de Portugal, frases curtas, verbos de ação, ícones simples
e uma composição visual limpa.
O recurso deve ajudar a perceber rapidamente: o que fazer, por onde começar,
que produto entregar e como participar.
```

---

### 4. Individual feedback → Learning poster

Use when the user has written feedback for multiple people and wants to share it
in a way that feels personal and visual rather than a list of bullet points.
Avatars make the feedback feel addressed to each person specifically.

```
Com base nos feedbacks em anexo, cria um cartaz de síntese.
Cada pessoa usa apenas o primeiro nome ou uma identificação neutra,
e utiliza exatamente o texto de feedback fornecido — não alteres o conteúdo.
Associa a cada pessoa uma pequena personagem original,
alternando personagens femininas e masculinas, sem copiar personagens comerciais.
O cartaz deve ter visual profissional, organizado e acolhedor.
Usa um título apelativo e subtítulo relacionado com [tema].
Mantém boa hierarquia, contraste e equilíbrio visual.
```

---

### 5. Long document → Visual storytelling (slides)

Use when the user has a long document (research, report, study) and needs to present
it to an audience without making them read the whole thing. The AI selects the most
important content and creates a visual sequence — exportable to PowerPoint.

```
Vais criar um storytelling com [N] imagens mantendo coerência e consistência visual
numa proporção de 16:9.
Usa o anexo e o seu conteúdo para criar essa sequência de imagens.
Trata-se de um documento sobre [tema].
Refere a fonte e coloca o meu nome em todas as imagens.
Interessa-me particularmente [secções/capítulos específicos].
Pretendo criar uma apresentação de síntese para apresentar a [audiência].
Faz boa organização, estruturação e sequência lógica com linguagem clara
e adequada para [audiência].
O design é essencial: apelativo, ajustado ao tema, mantendo a clareza.
```

**Tip:** The generated images can be exported directly into PowerPoint as slides.

---

### 6. One infographic → Four style options

Use when the user has existing content (or an old infographic) and isn't sure what
visual style fits best. Getting 4 options at once avoids multiple revision rounds.

```
Coloquei em anexo uma infografia existente [ou: o conteúdo que quero visualizar].
Fica apenas com os textos: títulos, subtítulos e corpo de texto.
O design, cores, imagens e todo o resto deve ser revisto e renovado.
Esta destina-se a [audiência].
Apresenta quatro imagens com proporções diferentes e estilos gráficos diferentes
(ex: corporativo, 3D, ilustração, isométrico) para eu poder escolher a melhor solução.
```

---

### 7. Photo → Edited visual  *(iterative — expect multiple prompts)*

Use when the user wants to modify a real photograph: change the background, remove
something, replace a face with a 3D avatar, or swap in a personal avatar.
Photo editing is naturally iterative — each step builds on the previous result.

**Background swap:**
```
Tira [elemento] da imagem em anexo.
[Novo elemento] deverá substituir [o que foi removido].
Mantém [o que deve ficar igual] tal e qual estão na fotografia original.
```

**Remove element:**
```
Edita a imagem, retira [elemento] que está na imagem.
Mantém todo o resto exatamente igual.
```

**Face to 3D avatar:**
```
Mantém toda a imagem e fotografia.
Altera apenas a minha personagem: coloca-a em 3D como se fosse uma personagem
de animação (estilo [Pixar/Disney/etc.]), mantendo todas as características físicas.
Mantém a mesma posição e expressão que tem na fotografia original.
```

**Replace face with personal avatar:**
```
Mantém toda a imagem e fotografia.
Altera apenas a minha personagem: coloca o meu avatar (em anexo)
na mesma posição e com as mesmas expressões da fotografia original.
```

---

### 8. Narrative/text → Comic strip  *(two-step process)*

Use when the user wants to turn a story, case study, or dialogue into a comic strip.
Two steps are necessary because generating the dialogue first — before adding photos —
gives much better control over what each character says.

**Step 1 — Draft the dialogue:**
```
Com base no [capítulo/texto] em anexo, cria um diálogo entre [personagem A] e [personagem B].
Faz [N] vinhetas com diálogos curtos — idealmente um balão de fala por personagem por vinheta.
```
*Review the dialogue before proceeding — it's easier to edit text than to fix a generated image.*

**Step 2 — Generate the comic with character photos:**
```
Cria o cartaz de banda desenhada com as [N] vinhetas e o diálogo gerado.
Usa as fotografias em anexo para as personagens:
[Nome A] é a fotografia [1], [Nome B] é a fotografia [2].
Mantém coerência e consistência nos traços físicos ao longo de todas as vinhetas.
```

**Critical:** Keep speech bubbles short — one per character per panel.
More text than that causes the AI to make layout errors and misplace dialogue.

---

### 9. Weak/old image → High-impact redesign

Use when the user has a diagram, scheme, or infographic that is outdated, low quality,
or visually unappealing, and wants to modernise it while keeping the same content.

```
Quero renovar a imagem em anexo mantendo exatamente o mesmo conteúdo.
Mantém o texto, a ideia central e os elementos presentes.
Renova completamente o design: estilo moderno, cores atualizadas, personagens coloridas
e com estilo contemporâneo.
O texto deve estar em português de Portugal.
```

---

### 10. Content + avatar → Presenter poster

Use when the user wants to create a poster where they appear as the "presenter" of
the content — useful for courses, webinars, or personal brand materials.
The avatar anchors the viewer's attention and personalises the content.

```
Com base na imagem do avatar em anexo, cria um cartaz sobre [tema].
O avatar deve surgir como apresentador visual do conteúdo,
mantendo traços físicos reconhecíveis, expressão profissional e postura comunicativa.
Organiza o conteúdo em blocos curtos: título forte, subtítulo claro e [3-5] ideias principais.
Usa estilo de cartaz [educativo/corporativo/científico], moderno, rigoroso e apelativo
adequado a [audiência].
Inclui uma imagem simbólica forte relacionada com o tema.
Garante hierarquia visual, contraste, alinhamento, equilíbrio e legibilidade.
Inclui o meu nome.
```

---

### 11. Existing template → Professional redesign  *(three-step process)*

Use when the user has found a template they like (e.g., in Canva) and wants to replace
the placeholder text with their own content. Three small prompts are better than one
large one — each step is easy to verify before moving on.

**Step 1 — Extract text from the source image:**
```
Olha para a imagem em anexo e retira todo o texto que está na imagem, por ordem.
Coloca aqui o texto.
```

**Step 2 — Shorten and adapt to fit:**
```
Para cada elemento do modelo, torna o texto um pouco mais curto
usando as tuas próprias palavras, mantendo o sentido.
```

**Step 3 — Place adapted text into the template:**
```
Tenho uma infografia em anexo [o template que gostas].
Coloca o texto que trabalhámos nesta infografia.
Mantém a estrutura, cores, imagens e estilo — muda apenas o texto.
Ajusta se o número de elementos não coincidir exatamente.
Muda também o título e o subtítulo.
```

---

### 12. Hand sketch → Digital resource

Use when the user has drawn something by hand (on paper, whiteboard, or even a child's
drawing) and wants a clean, professional digital version. The key is to preserve the
original intent of the drawing — the AI improves the form, not the content.

**Sketch to professional diagram:**
```
Faz um fluxograma ou infografia moderna a partir da imagem em anexo,
que é um esquema feito à mão.
O resultado deve ser profissional, claro, com cores e ícones se necessário.
Toma as decisões de design que achares mais adequadas para clareza e legibilidade.
```

**Child drawing → Illustrated version (preserve original faithfully):**
```
A partir da imagem em anexo (um desenho feito por uma criança),
dá vida às personagens e elementos presentes.
Respeita exatamente o desenho original — não cries figuras novas nem alteres a composição.
O resultado deve ser fiel ao desenho, apenas com melhor qualidade visual.
```

---

## Quality rules

These rules apply to all 12 strategies. They exist because the most common failures
in AI visual generation come from exactly these issues:

1. **Attach the source** — the AI transforms what you give it; without the file, it invents
2. **Name the audience** — "professores", "equipa comercial", "alunos adultos" changes tone and complexity
3. **State the language** — always write "português de Portugal" explicitly; the AI defaults to BR or EN
4. **Protect privacy** — replace real names with neutral IDs before attaching any file with personal data
5. **Review text in images** — AI frequently introduces typos or changes words in generated images; always read the final text
6. **You validate, AI generates** — the AI amplifies your work but cannot check factual accuracy; that responsibility stays with you
7. **Platform flexibility** — all prompts work in ChatGPT, Gemini, and Copilot; choose based on what you have access to

---

## When NOT to use this skill

| Situation | Better skill |
|---|---|
| Creating a visual with no existing input | `canvas-design` |
| Building a full slide deck (.pptx file) | `pptx` |
| Analyzing data without needing a visual | `xlsx` |
| Video content from photos or storyboard | `ai-video-creator` |
