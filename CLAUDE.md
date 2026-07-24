# Claude Skills Project

## O que é este projeto

Repositório de desenvolvimento de Agent Skills para Claude Code. Cada pasta é uma skill — um ficheiro `SKILL.md` que dá ao Claude competência especializada on-demand em determinados contextos.

## Estrutura

```
c:\projetos\Skills\Claude\       ← repositório de desenvolvimento (aqui)
C:\Users\Utilizador\.claude\skills\  ← diretório ativo carregado pelo Claude Code
```

As skills neste repositório são o source of truth. Para ficarem ativas, têm de existir também em `C:\Users\Utilizador\.claude\skills\`. A sincronização é manual (ver abaixo).

## Como as skills funcionam

- **Metadata** (name + description) — sempre em contexto; é o que o Claude usa para decidir se ativa a skill
- **Corpo do SKILL.md** — carregado quando a skill é ativada
- **references/** — ficheiros carregados on-demand dentro da skill

A `description` é o algoritmo de routing — determina quando a skill dispara. É o campo mais importante.

## Instalação completa (novo ambiente)

Script único para todas as 137 skills:
- **`install-skills.ps1`** (Windows) — instala todas as 137 skills deste repo numa máquina nova

### Windows (novo ambiente)
```powershell
# Opção A: clonar o repo e correr o script
git clone https://github.com/Nankov-ai/anthropics-skills.git
powershell -ExecutionPolicy Bypass -File anthropics-skills\install-skills.ps1

# Opção B: download direto do script (sem clonar)
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Nankov-ai/anthropics-skills/main/install-skills.ps1" -OutFile "install-skills.ps1"
powershell -ExecutionPolicy Bypass -File install-skills.ps1

# Depois, recarregar no Claude Code:
# /reload-skills
```

> **Nota:** O `install-skills.ps1` faz download direto dos SKILL.md do GitHub — sem conteúdo embutido, sem problemas de encoding. Branch default: `main`. Atualizado em Jul 2026 para cobrir todas as 137 skills.

## Sincronização

Para ativar uma skill nova ou atualizada:

```powershell
# Copiar skill específica
Copy-Item -Path "c:\projetos\Skills\Claude\<skill-name>" `
          -Destination "C:\Users\Utilizador\.claude\skills\<skill-name>" `
          -Recurse -Force

# Depois no Claude Code:
# /reload-skills
```

### Sessão 16 — o que foi feito (Jul 2026)

**`aiact` — correção factual (22 Jul 2026):**
- Verificado artigo https://superhumano.academy/blog/ia-act-o-que-as-empresas-precisam-de-fazer — conteúdo não trouxe informação nova relevante, mas a verificação expôs 2 erros factuais já existentes na skill
- **Corrigido**: Literacia em IA (Art. 4) estava datada de Mai 2025 na skill; data correta é **Fev 2025**, junto com as proibições (Art. 5) — mesma data de aplicação
- **Corrigido**: obrigações GPAI estavam agrupadas com Alto Risco em Ago 2026; data correta é **Ago 2025** — um ano antes da maioria das obrigações de Alto Risco (Anexo III)
- **Adicionado**: reconhecimento de emoções no local de trabalho e em instituições de ensino à lista de práticas proibidas (Art. 5.1.f) — confirmado pelo artigo, estava em falta na skill

### Sessão 15 — o que foi feito (Jul 2026)

**`GEM-Assistente-Pessoal/Assistente-Pessoal.md` — novo:**
- Pedido original do utilizador (print de prompt "acesso a tudo" para um Project ChatGPT/Codex) avaliado com o Prompt Audit Mode de `agent-prompt-builder`
- Decisão: não criar skill nova — é um deliverable pontual, não uma capacidade repetível distinta; risco de conflito de routing com `agent-prompt-builder` (mesmo padrão do histórico de otimização de 30 Jun)
- Duas versões produzidas: Claude (Custom Instructions de Project, com inventário real de conectores: Gmail, Calendar, Drive, Notion) e Gemini (Instructions de Gem, Workspace nativo)
- Reforços face ao original: regra "ver não é agir", tratamento de dados sensíveis entre fontes, defesa explícita contra prompt injection vindo de conteúdo externo, fallback para fontes não ligadas (Slack/Granola/Twitter/Instagram/YouTube não existem como conector em nenhuma das duas plataformas), formato de resposta, ordem de prioridade
- Nota explícita: acesso a fontes não se resolve por prompt, exige ligar conector real em cada plataforma; lista de fontes deve ser atualizada manualmente à medida que evolui

### Sessão 14 — o que foi feito (Jul 2026)

**Correção ao `GEM-Prompt-Engineer/Prompt-Engineer-Gem.md`:**
- O bloco de código "Versão Melhorada" tinha quebras de linha manuais a meio de frases (efeito de word-wrap ao escrever o ficheiro), o que ficava "partido" ao colar no campo Instructions do GEM — reflui para parágrafos contínuos
- Removida referência a caminho local (`G:\O meu disco\Formação\Prompts\`) das notas de contexto — não deve haver caminhos de ficheiro do computador dentro de conteúdo destinado a ser copiado para uma ferramenta externa

### Sessão 13 — o que foi feito (Jul 2026)

**`agent-prompt-builder` — novo "Prompt Audit Mode":**
- Skill estendida para cobrir avaliação/melhoria de prompts já existentes, não só criação do zero — pedido do utilizador: tem um GEM "Prompt-Creator" que recebe prompts de terceiros para avaliar, mas o GEM só sabia criar
- Checklist de 16 pontos (13 gerais + 3 específicos para prompts de sistema: scope lock, fallback, ordem de prioridade), extraído e expandido de `Engenharia-de-Prompts-Book.pdf` (`G:\O meu disco\Formação\Prompts\`)
- Novo `references/frameworks.md` — catálogo de frameworks de prompt (RTF, CO-STAR, RACE, CREATE, PACEF, PASECT, RISE, RISEN, TAG, SPAR) com guia de escolha, extraído da mesma fonte
- Descrição da skill atualizada para disparar em "avaliar/rever/criticar prompt" e "criar um prompt engineer/evaluator"

**`GEM-Prompt-Engineer/Prompt-Engineer-Gem.md` — novo:**
- Versão melhorada do GEM "Prompt-Creator GPT" do utilizador, produzida aplicando o próprio Prompt Audit Mode acima ao prompt original
- Passa a ter dois modos (deteção automática): Criação (mantém o template original) e Auditoria (novo, com o checklist de 16 pontos)
- Adicionado scope lock + fallback (o GEM original não recusava pedidos fora de âmbito)

### Sessão 12 — o que foi feito (Jul 2026)

**Reorganização em pastas dedicadas por projeto GEM:**
- `apresentacoes/` e `Apresentações/` removidas — conteúdo movido para pastas próprias
- `GEM-Andrea/` — `Andrea-Prompt-Gemini-Gem.md` (original, intocado) + `Andrea-Prompt-Gemini-Gem-working.md` (cópia de trabalho)
- `GEM-Classificador-Google-AI/` — `GEM-Classificador-Google-AI.md` (original, único ficheiro; a cópia V2 foi criada e depois apagada por já não ser necessária)

**Safeguards reforçadas no `Andrea-Prompt-Gemini-Gem-working.md` (secção 7):**
- Consistência de identidade (7.1) passa a incluir iluminação e textura de pele, e usa linguagem mais direta: imagens inconsistentes devem ser "rejeitadas e descartadas"
- Prevenção de uso indevido (7.2) passa a nomear "deepfakes" explicitamente
- Confirmado que estas safeguards só atuam em caso de violação — não alteram nem influenciam a resposta normal do GEM dentro do seu propósito

**Nota importante identificada nesta sessão:** as safeguards de fotografia/identidade de pessoas reais aplicam-se exclusivamente ao GEM Andrea. O GEM Classificador Google AI (classificação de use cases em ferramentas Google AI, sem geração de imagens de pessoas) tem um âmbito completamente diferente — regras de um não devem ser copiadas para o outro sem verificação.

### Sessão 11 — o que foi feito (Jul 2026)

**Cópia de trabalho do ficheiro Andrea:**
- `apresentacoes/Andrea-Prompt-Gemini-Gem.md` fica **intocado** — versão de referência original, congelada
- `apresentacoes/Andrea-Prompt-Gemini-Gem-working.md` — cópia criada para qualquer edição futura; é este ficheiro que deve ser alterado, nunca o original

### Sessão 10 — o que foi feito (Jul 2026)

**Ficheiro "Andrea" — partilhado por terceiro (projeto da mulher do utilizador), verificado (20 Jul 2026):**
- `apresentacoes/Andrea-Prompt-Gemini-Gem.md` — system prompt para um Gemini Gem chamado "Andrea": fotógrafa virtual que gera séries de fotos fotorrealistas de uma pessoa real com identidade consistente entre gerações, para branding pessoal/marca
- Verificação: sem código executável, sem chamadas de rede, sem prompt injection. Tem safeguards próprias fortes (aviso de consentimento obrigatório antes de gerar imagens de pessoas reais, recusa de conteúdo sexualizado/difamatório, recusa de replicar estilo de fotógrafo vivo por nome)
- **Não é uma skill Claude Code** (sem YAML frontmatter `name`/`description`, escrito para colar no campo "Instruções" de um Gem no Gemini, assume geração nativa de imagem que o Claude Code não tem) — arquivado apenas como referência em `apresentacoes/`, não instalado como skill
- Conteúdo útil (fluxo de consistência de identidade, consent gate, freeze de Identity Lock entre prompts de uma série) incorporado como **Mode C** na skill `photo-prompt` existente, adaptado ao facto de `photo-prompt` só construir texto de prompt (não gera imagem nativamente)

### Sessão 9 — o que foi feito (Jul 2026)

**3 novas skills — partilhadas por terceiro (Professor de IA, pessoa não conhecida do utilizador), verificadas e instaladas (20 Jul 2026):**
- `illustration-prompt` — constrói prompts avançados para geração de ilustrações AI (Midjourney, Nano Banana, GPT Image, Flux); framework de 17 componentes, presets de estilo, camadas de imperfeição
- `nano-edit` — constrói prompts para edição/composição de imagens AI (isolar objeto, montar cena com múltiplos assets, mudar ângulo de câmara); sistema de 6 blocos e tokens de consistência para séries
- `photo-prompt` — constrói prompts avançados para geração de fotos AI-realistas; framework de componentes, presets, 5 camadas de realismo, troubleshooting de iteração
- Verificação de segurança antes de instalar: sem código executável, sem chamadas de rede, sem exfiltração de dados, sem prompt injection, sem caracteres Unicode escondidos — apenas texto/Markdown puro. Guardrails próprias incluídas (recusa de conteúdo com menores). Tecnicamente seguras; proveniência da pessoa não verificada.
- Instaladas em `C:\Users\Utilizador\.claude\skills\` e movidas para a estrutura padrão do repo (sem sufixo `.skill`)

### Sessão 8 — o que foi feito (Jul 2026)

**`aiact` — atualização major (16 Jul 2026):**
- Baseada na apresentação ISCTE Módulo 7 sobre AI Act
- Adicionada categoria GPAI e obrigações (limiar de risco sistémico >10²⁵ FLOPs)
- Timeline de aplicação (Fev 2025 → Mai 2025 → Ago 2026 → Ago 2027)
- Tabela Provider vs Deployer expandida com orientação específica Nodeflow
- 8 obrigações para IA de Alto Risco (logging, base de dados UE, marcação CE)
- Tabela de interação AI Act ↔ RGPD (DPIA vs FRIA, Art. 22 vs supervisão humana)
- Framework de governança de IA (AI Officer, literacia, registo de incidentes)
- Terceiro nível de coima (7,5M€/1% por informação falsa às autoridades)
- Checklist dividida em Risco Limitado vs Alto Risco
- Art. 50 (transparência) expandido com estado por app Nodeflow
- SKILL.md passou de 32 para ~175 linhas
- Confirmado em sync entre repo e `C:\Users\Utilizador\.claude\skills\aiact\`

## Skills neste repositório (139)

> **Ponto de restauro:** tag `pre-optimization-2026-06-30` no GitHub.
> Para reverter: `git checkout pre-optimization-2026-06-30`
> Otimização de 30 Jun 2026: removidas `loop` (absorvida em `loop-engineering`) e
> `prompt-builder` (vazia); descriptions afinadas em `review`, `loop-engineering`,
> `self-improving-loop` para eliminar routing conflicts.

### Skills desenvolvidas neste repositório (46)

| Skill | Origem |
|---|---|
| linkedin-profile-builder | Criada de 2 perfis de referência analisados — headline, About, dual-identity (corporate + founder), conteúdo (Jul 2026) |
| vibecoding | Criada de curso Vibecoding (Udemy) — 8 tipos de prompt para construir software com IA, CoT, biblioteca de prompts (Jul 2026) |
| agent-prompt-builder | Original; estendida com padrão Lovable/Bolt/v0 (Jul 2026) e padrão Manus/superagente (Jul 2026) |
| ai-video-creator | Criada de manual de curso IA — Flow (anúncios cinematográficos) + Higgsfield (animação de fotos) (Jul 2026) |
| visual-content-transformer | Criada de vídeo de curso IA — 12 estratégias para transformar conteúdo existente em visual profissional, com prompts exatos para cada estratégia (Jul 2026) |
| ai-agent-patterns | Criada de imagem "15 AI Agent Design Patterns" (Jun 2026) |
| agent-reasoning | Original |
| aiact | Original |
| faturix | Original |
| nando-global | Original |
| algorithmic-art | Criada sessão Jun 2026 |
| b2b-outbound-automation | Criada de transcrição masterclass Growth Inventions |
| co-intelligence | Criada de *Co-Intelligence* (Ethan Mollick) — 4 modos de colaboração humano-IA, sugestão proativa de Centauro/Ciborgue (Jun 2026) |
| brand-guidelines | Criada sessão Jun 2026 |
| canvas-design | Criada sessão Jun 2026 |
| claude-api | Criada sessão Jun 2026 |
| code-review | Criada sessão Jun 2026 |
| context-engineering | Criada de artigo e imagens sobre context engineering — contexto primeiro, prompt depois (Jun 2026) |
| notebooklm | Criada de manuais de curso IA — workflow NotebookLM, supercérebros, podcast, extensão YouTube (Jul 2026) |
| doc-coauthoring | Criada sessão Jun 2026 |
| docx | Criada sessão Jun 2026 |
| enterprise-ai-agent-designer | Criada de apresentação IT consulting (Jun 2026) |
| fewer-permission-prompts | Criada sessão Jun 2026 |
| frontend-design | Criada sessão Jun 2026 |
| gem-builder | Criada sessão Jun 2026 |
| init | Criada sessão Jun 2026 |
| internal-comms | Criada sessão Jun 2026 |
| it-consulting-proposal | Criada de apresentação IT consulting (Jun 2026) |
| keybindings-help | Criada sessão Jun 2026 |
| local-agent-trainer | Criada sessão Jun 2026 |
| loop-engineering | Criada de artigo sobre loop engineering com /goal e /loop; absorveu skill `loop` (Jun 2026) |
| mcp-builder | Criada sessão Jun 2026 |
| pdf | Criada sessão Jun 2026 |
| pptx | Criada sessão Jun 2026 |
| pt-checkout-builder | Criada de screenshot SalesPark checkout (Jun 2026) |
| review | Criada sessão Jun 2026 — limitada a prosa/docs/specs (não código) |
| run | Criada sessão Jun 2026 |
| schedule | Criada sessão Jun 2026 |
| security-review | Criada sessão Jun 2026 |
| self-improving-loop | Criada de artigo sobre self-improving loops com honest-grader e self-journal (Jun 2026) |
| simplify | Criada sessão Jun 2026 |
| skill-creator | Criada sessão Jun 2026 |
| skill-evaluator | Criada de whitepaper Agent Skills (Google/Anthropic, Mai 2026) |
| slack-gif-creator | Criada sessão Jun 2026 |
| termos-condicoes-pt | Criada sessão Jun 2026 |
| theme-factory | Criada sessão Jun 2026 |
| update-config | Criada sessão Jun 2026 |
| verify | Criada sessão Jun 2026 |
| webapp-testing | Criada sessão Jun 2026 |
| web-artifacts-builder | Criada sessão Jun 2026 |
| xlsx | Criada sessão Jun 2026 |

### Skills de terceiros incluídas no repositório (Jul 2026)

Todas as skills de terceiros foram integradas no repo `Nankov-ai/anthropics-skills` (são open source públicas). O `install-skills.ps1` instala tudo de um só lugar.

| Origem | Skills incluídas |
|--------|-----------------|
| **gstack** (garrytan/gstack) | _gstack-command, autoplan, benchmark, benchmark-models, browse, canary, careful, codex, context-restore, context-save, cso, design-consultation, design-html, design-review, design-shotgun, devex-review, diagram, document-generate, document-release, freeze, gstack, gstack-upgrade, guard, health, investigate, land-and-deploy, landing-report, learn, loop, make-pdf, office-hours, open-gstack-browser, pair-agent, plan-ceo-review, plan-design-review, plan-devex-review, plan-eng-review, plan-tune, pr-to-video\*, prompt-builder, qa, qa-only, retro, scrape, setup-browser-cookies, setup-deploy, setup-gbrain, ship, skillify, spec, sync-gbrain, unfreeze |
| **stop-slop** (hardikpandya/stop-slop) | stop-slop |
| **last30days** (mvanhorn/last30days-skill) | last30days |
| **taste-skill** (Leonxlnx/taste-skill) | taste-skill, taste-skill-v1, minimalist-skill, brutalist-skill, soft-skill, redesign-skill, image-to-code-skill, stitch-skill, brandkit, output-skill, imagegen-frontend-web, imagegen-frontend-mobile |
| **hyperframes** (heygen-com/hyperframes) | hyperframes, hyperframes-core, hyperframes-animation, hyperframes-creative, hyperframes-media, hyperframes-cli, hyperframes-registry, general-video, product-launch-video, website-to-video, pr-to-video, faceless-explainer, motion-graphics, music-to-video, slideshow, embedded-captions, graphic-overlays, media-use, remotion-to-hyperframes |

## Histórico da sessão de criação (Jun 2026)

### Contexto inicial
O projeto tinha 5 pastas com SKILL.md já existentes:
- `agent-prompt-builder` — criação de system prompts para agentes em múltiplas plataformas
- `agent-reasoning` — 16 estratégias de raciocínio em 4 famílias com benchmarks
- `aiact` — legislação europeia de IA (AI Act, RGPD, multas, classificação de risco)
- `faturix` — agente Ollama (mistral:7b) + Streamlit para extração de documentos financeiros
- `nando-global` — QA rules P1/P2/P3 obrigatórias em todas as respostas

O sistema mostrava 57 skills disponíveis após `/reload-skills`.

### O que foi feito

**1. Criação de 32 skills em falta**
Identificadas as skills listadas no sistema mas sem pasta neste repositório. Criadas as pastas e SKILL.md para cada uma.

**2. skill-evaluator — extraída do whitepaper Agent Skills (Google/Anthropic, Mai 2026)**
O whitepaper documentou 4 failure modes com dados reais de produção:
- **Trigger Failure** — Vercel: 56% de non-invocation em skills esperadas a ativar consistentemente. Uma skill sem instruções marcou 58%; sem skill nenhuma o agente marcou 63% — uma skill mal desenhada subtrai capacidade.
- **Execution Failure** — Latitude (Mar 2026): scoring só no output final passa 20-40% mais casos do que trajectory-aware scoring. A diferença representa casos em que o agente chegou ao resultado correto por sequência incorreta de tool calls — aceitável em read-only, crítico em action-allowed.
- **Token Budget Failure** — MCPVerse: queda de 18.2% de accuracy no Claude Sonnet por proliferação de ferramentas. Skills com corpo > 5.000 tokens podem passar em isolamento mas causam context rot quando co-carregadas.
- **Regression** — skill nova quebra routing de skills existentes por sobreposição de descrições.

A skill inclui o workflow EDD (Evaluation-Driven Development), checklists, e formato de relatório. Ficheiros de referência em `skill-evaluator/references/`.

**3. Descoberta da arquitetura de diretórios**
As skills ativas são lidas de `C:\Users\Utilizador\.claude\skills\`, não desta pasta. As 4 skills originais já lá estavam. Faltavam 13 das novas — copiadas manualmente.

**7. pt-checkout-builder — criada de screenshot de checkout SalesPark (Jun 2026)**
Skill para construir checkout flows e integrar plataformas de pagamento para produtos digitais portugueses.
Cobre: UX multi-step (Identificação → Opções → Pagamento), campos obrigatórios PT (NIF com validação por checksum, morada, código postal), IVA 23%, cupões de desconto, e integração com SalesPark, Stripe, EasyPay e MB Way. Inclui exemplos de código para webhooks, validação de NIF, e checklist pré-lançamento com requisitos RGPD.

**6. ai-agent-patterns — extraída de imagem dos 15 padrões de design de agentes IA (Jun 2026)**
Skill dedicada a selecionar e explicar padrões arquiteturais para sistemas de agentes IA.
Cobre os 15 padrões: Single Agent, Sequential, Parallel, Loop, Review & Critique, Iterative Refinement, Coordinator, Hierarchical Decomposition, Swarm, ReAct, Human-in-the-Loop, Plan-and-Execute, Reflexion, Custom Logic, Event-Driven Agent.
Inclui guia de seleção por cenário e padrões combinados.

**5. enterprise-ai-agent-designer + it-consulting-proposal — extraídas de apresentação IT consulting (Jun 2026)**
Duas skills criadas a partir de uma apresentação de uma empresa de IT consulting (conteúdo confidencial — sem nomes de pessoas ou empresas gravados).
- `enterprise-ai-agent-designer`: desenha soluções completas de agentes IA por indústria (jurídico, farmacêutico, banca, retalho). Padrões de arquitetura com Azure OpenAI, LangChain, WSO2, etc.
- `it-consulting-proposal`: gera propostas e pitches de consultoria IT estruturados. Cobre 7 práticas de serviço, 4 modelos de colaboração, e parcerias (Microsoft Gold, Atlassian Gold, WSO2 VAR, Google).

**5. co-intelligence — extraída de Co-Intelligence (Ethan Mollick)**
Framework dos 4 modos de colaboração humano-IA: Solo, Delegado, Centauro, Ciborgue.
A skill sugere proativamente Centauro ou Ciborgue sempre que o utilizador está prestes a delegar
em modo puro — garantindo que a escolha é consciente. Inclui tabela de aplicação específica
à criação de skills e guião de como apresentar a sugestão ao utilizador.

**4. b2b-outbound-automation — extraída de transcrição de masterclass**
Sessão de 02/06/2026 do ISCTE Executive Education (pós-graduação IA para Gestão).
Conteúdo extraído sem nomes de clientes ou informação confidencial.
Framework dos 4 blocos: infraestrutura de email → TAM + lead scoring → intent data → sequenciadores multicanal. Inclui o padrão "operating system" para agentes (regras lidas antes de cada ação) e a regra de human-in-the-loop antes de qualquer envio.

### Estado após sessão (Jul 2026 — sessão 4)
- **137 skills** no repo `Nankov-ai/anthropics-skills` — fonte única de verdade
- **137 skills** em `C:\Users\Utilizador\.claude\skills\` — 100% em sync com o repo
- `install-skills.ps1` reescrito para cobrir todas as 137 skills (script único para nova máquina)
- Skills de terceiros (gstack, hyperframes, taste-skill, stop-slop, last30days) integradas no repo
- `autoplan` atualizado da fonte gstack (1853 linhas) e `hyperframes` atualizado da fonte heygen (166 linhas)
- `graphifyy` instalado como CLI + CLAUDE.md configurado em 5 projetos (norauto-visionai+, Visionai+, OutOfBox, hiperfrio-o2c-rag, treino-e-diagnóstico-ocular)
- `/last30days` queries de mercado adicionadas ao CLAUDE.md dos mesmos 5 projetos
- VSCode tasks automáticas (graphify check on folder open) configuradas nos 5 projetos
- Comando global `/analyze` criado em `~/.claude/commands/analyze.md` (dispatch automático de skills por projeto)
- Ponto de restauro: tag `pre-optimization-2026-06-30` no GitHub

### Sessão 3 — o que foi feito (Jun–Jul 2026)

**Skills criadas:**
- `loop-engineering` — /goal e /loop commands, charter template, LOOP-STATE.md
- `self-improving-loop` — honest-grader subagent, self-journal.md, self-rules.md, /improve command; estendida com failure taxonomy, 4 prompt templates, signal taxonomy, build sequence
- `context-engineering` — 5-layer model, context-first decision flow, cascade failure diagram, retrieval/memory/tool output guidelines
- `notebooklm` — closed-context AI (sem alucinações), workflow 5 passos, padrão supercérebros, podcast/study guide/timeline/infographic, extensão YouTube to NotebookLM (Jul 2026)
- `ai-video-creator` — Flow (anúncios cinematográficos: imagens + storyboard → vídeo 15-30s) + Higgsfield (animação de fotografias estáticas); workflow combinado, templates, exemplos (Jul 2026)
- `visual-content-transformer` — 12 estratégias para transformar qualquer conteúdo (texto, dados, foto, esboço, documento) em visual profissional; prompts exatos para cada estratégia (Jul 2026)

**Skills estendidas:**
- `agent-prompt-builder` — adicionada secção no-code app builders (Lovable/Bolt/v0) (Jul 2026); adicionado padrão superagente/Manus: prompt único detalhado para agentes autónomos (Jul 2026)

**Otimização de routing (30 Jun 2026):**
- Removida `loop` (absorvida em `loop-engineering`)
- Removida `prompt-builder` (estava vazia)
- Descriptions afinadas: `review` (só prosa/docs), `loop-engineering` e `self-improving-loop` (boundaries explícitos entre si)

**Comando `/analyze`:**
- Criado em `~/.claude/commands/analyze.md` e em `commands/analyze.md` no repo
- Lê o projeto, mapeia skills relevantes, aplica-as com análise real
- Nota: funciona no Claude Code CLI; no Antigravity IDE usar linguagem natural ("analisa este projeto")

### Sessão 7 — o que foi feito (Jul 2026)

**Skills de educação — criadas e expandidas:**
- `ai-na-formacao` — expandida com 6 ferramentas especializadas para aprendizagem:
  - Gliglish (prática oral de idiomas), Mizou (chatbots de estudo por disciplina), Turboscribe (transcrição áudio/vídeo), Diffit (adaptação de conteúdos por nível cognitivo), Magic School (automação de preparação docente), Gamma (criação de apresentações com IA)
  - Conteúdo extraído de apresentação "IA Generativa na Aprendizagem" (confidencial — sem nomes gravados)
- `visual-ia-educacao` — criada de webinar "Criar e Editar Recursos Visuais com IA" (PPTX + imagens de 21 Mai 2026): 8 Regras de Ouro do Prompt Visual, 15 Possibilidades de Edição, guia de ferramentas (ChatGPT Images 2.0, Firefly, Gemini, Canva AI), workflow 5 passos, checklist antes de publicar
- `ai-na-formacao` — originalmente criada de 3 fontes: webinar UAb + "Think Outside The Bot" + análise de contexto educativo PT/UK. Cobre: 4 Princípios Co-inteligência (Ethan Mollick), Framework ético, 4 Tipos de tarefas docentes, Modelo SAMR, AILit Framework, 12 Dimensões IA na Educação, RGPD, design de avaliação resistente a IA

**Skill criada — `ai-adoption-strategy`:**
- Criada de 2 transcrições de webinar (14 Jul 2026) + 2 fotos de slides (confidencial — sem nomes gravados)
- Cobre: API vs subscrição (custo real), "estender a passadeira" via MCP connectors, shadow IT inteligente, sandbox tecnológico empresarial, LLMs como nova camada de abstração, canais B2B em Portugal (LinkedIn €4/lead, YouTube €200/100k impressões)
- Slide confirmado: mesmos 500M tokens = $8.000 API vs $200 subscrição

**Skill criada — `browser-agents`:**
- Criada de artigo "How Browser Agents Automate Online Workflows" (prints Jul 2026)
- Cobre: definição, loop 5 passos, 6 casos de uso reais, comparação de 5 ferramentas (Browserbase, MultiOn, Adept, OpenAI Operator, Anthropic Computer Use), benefícios, limitações, guia de arranque
- Skill de conhecimento — ativa quando o utilizador descreve tarefa web repetitiva ou pergunta sobre automação de browser

**GEM criado — Classificador Google AI:**
- Ficheiro: `Apresentações/GEM-Classificador-Google-AI.md`
- Baseado em prints de sessão de formação (Formação.png, Formação1.png, Prompt.png)
- Classifica use cases em 8 ferramentas Google AI (Gemini Application, Gemini for Workspace, NotebookLM, AI Studio, Workspace Studio, Imagen, Veo, Google Vids)
- Aceita qualquer formato de input (PDF, Sheet, CSV, imagem, áudio, vídeo, etc.)
- Trilingue: PT, EN, FR
- Output: página HTML com post-its arrastáveis, fundo escuro, adequado para projeção

**Sistema de auto-melhoria de skills — criado:**
- `~/.claude/CLAUDE.md` — CLAUDE.md global (novo ficheiro); instrui o Claude a registar falhas de skills silenciosamente em qualquer conversa e a processar melhorias automaticamente no início de cada sessão
- `~/.claude/skill-feedback.md` — log de falhas; entradas adicionadas pelo Claude quando o utilizador descreve uma falha em chat, sem precisar de comando
- Ciclo: falha descrita em chat → registo automático → início de sessão seguinte (7+ dias) → Claude melhora o SKILL.md e informa numa linha
- Inspirado no conceito Software 3.0 de Karpathy — o prompt é software e pode ser otimizado por outro LLM

**MCP notebooklm — fix recorrente + painel Gemini (continuação Sessão 6):**
- Skills criadas num contexto de fix do erro MCP notebooklm no Antigravity IDE — ver Sessão 6 para detalhes técnicos

### Sessão 6 — o que foi feito (Jul 2026)

**MCP notebooklm — fix recorrente + prevenção:**
- Diagnóstico: `notebooklm-mcp.exe` precisa de subcomando `server` para entrar em modo MCP; sem ele imprime help e faz EOF imediato
- Fix aplicado: `settings.json` — `"args": ["server"]` em vez de `[]`
- Versão pinada: `pip install "notebooklm-mcp==2.0.11"` — confirmado já instalado
- Script de diagnóstico criado: `C:\projetos\mcp-check.ps1` — verifica e repara automaticamente path + args; usar quando o erro reaparecer antes de investigar manualmente

**MCP notebooklm no painel Gemini (Antigravity IDE):**
- O painel Skills do lado direito do Antigravity usa configuração MCP separada: `C:\Users\Utilizador\.gemini\antigravity\mcp_config.json`
- Ficheiro estava vazio; adicionado `notebooklm-mcp` com `args: ["server"]` para dar acesso aos projetos NotebookLM a partir do painel Gemini
- Erro `MCP Error` persistente no painel é um bug da extensão `googlecloudtools.datacloud-0.5.2` (EINVAL ao tentar fazer `unlink` de named pipes Windows no arranque) — não afeta Claude Code nem notebooklm; aguardar update da extensão Google Cloud Tools

**Projeto LinkedIn continuado:**
- About/Summary PT e EN atualizados para v2.4: removidos contrastes implícitos com terceiros, abertura afirmativa (padrão Bruno Oliveira/Rogério Canhoto), CTA sem sobreposição com função Norauto
- Headline definitiva aplicada no LinkedIn (Jul 2026, EN): `Generative AI for Business | Certified Trainer (CCP · E-Learning) | Digital Marketing | International Category Manager | Nodeflow: "Less Friction. More Impact."`
- CLAUDE.md do projeto LinkedIn atualizado com regra: nunca definir por negação ou contraste — afirmar o que se faz

### Sessão 5 — o que foi feito (Jul 2026)

**Skills criadas:**
- `linkedin-profile-builder` — headline (3 fórmulas PT/EN/híbrido), About/Summary com padrão dual-identity (corporate + founder), reescrita de experiência, featured section, estratégia de conteúdo, checklist de auditoria; baseada em 2 perfis de referência analisados (Jul 2026)
- `vibecoding` — guia completo de prompts para construir software com IA; 3 fundações (CoT, delimitadores, especificidade), 8 tipos de prompt especializados (arquitetura, componente, estilização, segurança, refatoração, debug, app completa/superagent, documentos), gestão de biblioteca de prompts; baseada em curso Vibecoding (Udemy, Jul 2026)

**Projetos criados:**
- `C:\projetos\Linkedin\` — projeto LinkedIn com CLAUDE.md completo (contexto Nodeflow + Norauto + audiências + estratégia de conteúdo), headline-options.md (6 variantes), about-draft.md (v1.0 PT, v2.0 PT baixo-risco, v2.0 EN)

### Sessão 4 — o que foi feito (Jul 2026)

**Grande sincronização repo ↔ local:**
- Fase 0: verificação de updates nas fontes originais — `autoplan` (gstack) e `hyperframes` (heygen) atualizados
- Fase 1: 108 skills copiadas para o repo e pushed (19 versões locais ricas + 89 skills de terceiros)
- Fase 2: 10 skills Grupo B (existiam no repo mas não no local) instaladas localmente
- Fase 3: `install-skills.ps1` reescrito — cobre todas as 137 skills, script único para nova máquina
- Fase 4: CLAUDE.md atualizado, repo pushed — 137 skills em repo e local, 100% em sync

**Resultado:** numa nova máquina, um único comando instala as 137 skills:
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Nankov-ai/anthropics-skills/main/install-skills.ps1" -OutFile "install-skills.ps1"
powershell -ExecutionPolicy Bypass -File install-skills.ps1
```

### Skills no ambiente remoto (100)
| Origem | Skills | Count |
|--------|--------|-------|
| nankov-ai/anthropics-skills | agent-prompt-builder, agent-reasoning, ai-agent-patterns, aiact, algorithmic-art, b2b-outbound-automation, brand-guidelines, canvas-design, claude-api, code-review, context-engineering, doc-coauthoring, docx, enterprise-ai-agent-designer, faturix, fewer-permission-prompts, frontend-design, gem-builder, init, internal-comms, it-consulting-proposal, keybindings-help, local-agent-trainer, loop-engineering, mcp-builder, nando-global, pdf, pptx, pt-checkout-builder, review, run, schedule, security-review, self-improving-loop, simplify, skill-creator, skill-evaluator, slack-gif-creator, termos-condicoes-pt, theme-factory, update-config, verify, web-artifacts-builder, webapp-testing, xlsx | 43 |
| gstack | gstack, autoplan, benchmark, benchmark-models, browse, canary, careful, codex, context-restore, context-save, cso, design-consultation, design-html, design-review, design-shotgun, document-generate, investigate, land-and-deploy, plan-eng-review, qa, qa-only, ship, session-start-hook | 23 |
| taste-skill | brandkit, brutalist-skill, image-to-code-skill, imagegen-frontend-mobile, imagegen-frontend-web, minimalist-skill, output-skill, redesign-skill, soft-skill, stitch-skill, taste-skill, taste-skill-v1 | 12 |
| hyperframes | hyperframes, hyperframes-animation, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-media, hyperframes-registry, embedded-captions, faceless-explainer, general-video, media-use, motion-graphics, music-to-video, pr-to-video, product-launch-video, remotion-to-hyperframes, slideshow, talking-head-recut, website-to-video | 19 |
| outros | stop-slop, last30days | 2 |

### Notas de instalação em ambiente remoto
O ambiente remoto do Claude Code usa um proxy local (127.0.0.1) que bloqueia `git clone` de repos externos. Para instalar skills externas nesse ambiente, usar `curl` diretamente para raw.githubusercontent.com em vez de git clone. O `install-external-packages.sh` não funciona diretamente — o outro Claude adaptou usando curl para buscar SKILL.md individualmente. O gstack instalou 23 skills (em vez de 50+) por esta limitação. O ficheiro `install-external-skills.sh` (criado pelo outro Claude) foi removido para evitar confusão.

## Convenções

- Descrições em inglês (melhor routing)
- Corpo do SKILL.md pode ser em PT ou EN consoante o contexto da skill
- Ficheiros de referência em `<skill>/references/`
- Nunca editar diretamente em `.claude\skills\` sem refletir a alteração aqui primeiro
