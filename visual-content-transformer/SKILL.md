---
name: visual-content-transformer
description: >
  Transform any existing content into a professional visual using AI image generation.
  Use when the user wants to convert text, data, feedback, a document, a photo, a sketch,
  or an old infographic into a visual output: infographic, dashboard, roadmap, poster,
  comic strip, presentation slides, or redesigned image. Triggers on phrases like
  "transforma em infográfico", "cria um cartaz", "converte em visual", "dashboard dos dados",
  "redesign desta imagem", "banda desenhada", "esboço para fluxograma", "avatar apresentador",
  "edita a fotografia", or any request to turn existing content into a visual asset.
  Does NOT cover creating visuals from scratch with no input — see canvas-design for that.
---

# Visual Content Transformer

## Core pattern

Input (any existing content) → AI prompt → Professional visual output.

The AI does not invent — it transforms what you give it.
Always provide the source material as an attachment or paste it directly.

---

## The 12 transformation strategies

### 1. Forum voices → Infographic

Convert student/team forum posts into a synthesis infographic.

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

**Use for:** Summarizing discussions, team retrospectives, feedback synthesis.

---

### 2. Survey data → Visual dashboard

Convert Excel/CSV survey responses into a visual dashboard with conclusions.

```
Analisa o ficheiro em anexo com respostas de um questionário.
Cria um dashboard visual em português de Portugal com as principais conclusões,
combinando cartões de indicadores, gráficos simples e uma síntese interpretativa objetiva.
O dashboard deve permitir uma leitura rápida: padrões dominantes, aspetos críticos,
tendências e possíveis implicações [pedagógicas/estratégicas/operacionais].
Usa um estilo profissional, limpo e contemporâneo.
Evita excesso de texto e não transformes interpretações em certezas absolutas.
```

**Use for:** Post-event surveys, NPS results, team assessments.

---

### 3. Activity/instructions → Visual roadmap

Convert complex instructions into a visual action map.

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

**Use for:** Project briefs, onboarding guides, step-by-step processes.

---

### 4. Individual feedback → Learning poster

Transform written feedback into a visual poster with avatars.

```
Com base nos feedbacks em anexo, cria um cartaz de síntese.
Cada pessoa usa apenas o primeiro nome ou uma identificação neutra,
e utiliza exatamente o texto de feedback fornecido.
Associa a cada pessoa uma pequena personagem original,
alternando personagens femininas e masculinas, sem copiar personagens comerciais.
O cartaz deve ter visual profissional, organizado e acolhedor.
Usa um título apelativo e subtítulo relacionado com [tema].
Mantém boa hierarquia, contraste e equilíbrio visual.
```

**Use for:** Team feedback sessions, performance reviews, learning summaries.

---

### 5. Long document → Visual storytelling (slides)

Convert a long PDF or study into a sequence of presentation images.

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

**Use for:** Summarizing research, presenting studies, academic posters.
**Tip:** Export the generated images directly to PowerPoint.

---

### 6. One infographic → Four formats and styles

Redesign an existing infographic in 4 different proportions and styles to choose from.

```
Coloquei em anexo uma infografia existente.
Fica apenas com os textos: títulos, subtítulos e corpo de texto.
O design, cores, imagens e todo o resto deve ser revisto e renovado.
Esta destina-se a [audiência].
Apresenta quatro imagens com proporções diferentes e estilos gráficos diferentes
(ex: corporativo, 3D, ilustração, isométrico) para eu poder escolher a melhor solução.
```

**Use for:** Refreshing old materials, A/B testing visual styles, rebranding content.

---

### 7. Photo → Edited visual (background, avatar, 3D)

Edit a real photograph: change background, remove elements, or create a 3D avatar.

**Background swap:**
```
Tira a árvore da imagem em anexo.
A areia e o mar deverão ficar como se fosse um campo de trigo.
Mantém as duas pessoas tal e qual estão na fotografia original.
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

**Avatar replacement:**
```
Mantém toda a imagem e fotografia.
Altera apenas a minha personagem: coloca o meu avatar (em anexo)
na mesma posição que está na fotografia e com as mesmas expressões.
```

**Use for:** Marketing materials, event posters, social media content.

---

### 8. Narrative/text → Comic strip

Transform a dialogue or story chapter into a comic strip (banda desenhada).

**Step 1 — Generate the dialogue:**
```
Com base no [capítulo/texto] em anexo, cria um diálogo entre [personagem A] e [personagem B].
Faz [N] vinhetas com diálogos curtos — idealmente um balão de fala por personagem por vinheta.
```

**Step 2 — Add character photos:**
```
Cria o cartaz de banda desenhada com as [N] vinhetas e o diálogo gerado.
Usa as fotografias em anexo para as personagens:
[Nome A] é a fotografia [1], [Nome B] é a fotografia [2].
Mantém coerência e consistência nos traços físicos ao longo de todas as vinhetas.
```

**Key rule:** Short dialogues only — one speech bubble per character per panel.
Longer text causes layout errors.

**Use for:** Educational storytelling, case studies, training scenarios.

---

### 9. Weak/old image → High-impact redesign

Recreate an outdated diagram, scheme, or infographic with modern design.

```
Quero que coloques em português o texto que está na imagem em anexo.
Mantém exatamente o texto, a ideia e os elementos presentes.
Quero os mesmos objetos e gestos mas com um estilo visual moderno.
As personagens devem ser coloridas e com estilo contemporâneo.
```

**Use for:** Updating training materials, modernizing diagrams, improving image quality.

---

### 10. Content + avatar → Presenter poster

Create a poster where your avatar presents the topic.

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

**Use for:** Webinar promotion, course materials, personal branding content.

---

### 11. Existing template → Professional redesign (3-step)

Swap the text of a template you like with your own content.

**Step 1 — Extract text from old image:**
```
Olha para a imagem em anexo e retira todo o texto que está na imagem, por ordem.
Coloca aqui o texto.
```

**Step 2 — Shorten and adapt:**
```
Para cada elemento do modelo, torna o texto um pouco mais curto
usando as tuas próprias palavras, mantendo o sentido.
```

**Step 3 — Place text in new template:**
```
Tenho uma infografia em anexo [o template que gostas].
Coloca o texto que trabalhámos nesta infografia.
Mantém a estrutura, cores, imagens e estilo — muda apenas o texto.
Ajusta se o número de elementos não coincidir exatamente.
Muda também o título e o subtítulo.
```

**Use for:** Reusing Canva templates, repurposing competitor layouts, rapid content production.

---

### 12. Hand sketch → Digital resource

Transform a hand-drawn sketch (paper, whiteboard, child's drawing) into a professional visual.

**Sketch to professional diagram:**
```
Faz um fluxograma ou infografia moderna a partir da imagem em anexo,
que é um esquema feito à mão.
O resultado deve ser profissional, claro, com cores e ícones se necessário.
Toma as decisões de design que achares mais adequadas para um recurso de aprendizagem.
```

**Child drawing → Illustrated version (preserving original):**
```
A partir da imagem em anexo (um desenho feito por uma criança),
dá vida às personagens e elementos presentes.
Atenção: respeita exatamente o desenho original — não cries figuras novas.
O resultado deve ser personalizado e fiel ao desenho original.
```

**Use for:** Whiteboard sessions, brainstorming outputs, personalised content.

---

## Quality rules (apply to all 12 strategies)

1. **Always attach the source** — the AI transforms what you give it, never invents
2. **Specify the audience** — "professores", "equipa de vendas", "alunos adultos"
3. **Specify language** — always state "português de Portugal" if needed
4. **Protect privacy** — use neutral IDs ("pessoa 1", "aluno 2") instead of real names
5. **Check text in images** — AI sometimes introduces typos in image text; always review
6. **Verify before publishing** — AI amplifies your work but you validate the content
7. **Platform flexibility** — these prompts work in ChatGPT, Gemini, and Copilot

## When NOT to use this skill

| Situation | Better skill |
|---|---|
| Creating a visual with no existing input | `canvas-design` |
| Building a full slide deck | `pptx` |
| Analyzing data without visual output | `xlsx` |
| Video content from photos | `ai-video-creator` |
