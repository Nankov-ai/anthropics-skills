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

Dois scripts separados por intenção:
- **`install-skills.ps1`** (Windows) — instala as 46 skills personalizadas deste repo
- **`install-external-packages.sh`** (Linux/Mac) — instala pacotes externos de terceiros (gstack, stop-slop, last30days, taste-skill, hyperframes)

### Windows (novo ambiente)
```powershell
# 1. Clonar o repositório (branch main — default)
git clone https://github.com/Nankov-ai/anthropics-skills.git

# 2. Instalar as 46 skills personalizadas
powershell -ExecutionPolicy Bypass -File anthropics-skills\install-skills.ps1

# 3. Opcional: instalar pacotes externos (requer WSL ou Git Bash)
bash anthropics-skills/install-external-packages.sh

# 4. Recarregar no Claude Code
# /reload-skills
```

### Linux/Mac (sessão remota ou novo ambiente)
```bash
# 1. Clonar o repositório
git clone https://github.com/Nankov-ai/anthropics-skills.git ~/.claude/skills

# 2. Instalar pacotes externos
bash ~/.claude/skills/install-external-packages.sh

# 3. Recarregar no Claude Code
# /reload-skills
```

> **Nota:** O `install-skills.ps1` faz download direto dos SKILL.md do GitHub — sem conteúdo embutido, sem problemas de encoding. Branch default alterado para `main` em Jul 2026.

O script `install-external-packages.sh` instala automaticamente todos os pacotes externos e o CLI graphifyy. Corre numa sessão remota do Claude Code ou em qualquer terminal com git + pip disponíveis.

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

## Skills neste repositório (44) + skills externas instaladas globalmente

> **Ponto de restauro:** tag `pre-optimization-2026-06-30` no GitHub.
> Para reverter: `git checkout pre-optimization-2026-06-30`
> Otimização de 30 Jun 2026: removidas `loop` (absorvida em `loop-engineering`) e
> `prompt-builder` (vazia); descriptions afinadas em `review`, `loop-engineering`,
> `self-improving-loop` para eliminar routing conflicts.

### Skills desenvolvidas neste repositório (44)

| Skill | Origem |
|---|---|
| agent-prompt-builder | Original; estendida com padrão Lovable/Bolt/v0 para no-code apps (Jul 2026) |
| ai-agent-patterns | Criada de imagem "15 AI Agent Design Patterns" (Jun 2026) |
| agent-reasoning | Original |
| aiact | Original |
| faturix | Original |
| nando-global | Original |
| algorithmic-art | Criada sessão Jun 2026 |
| b2b-outbound-automation | Criada de transcrição masterclass Growth Inventions |
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

### Skills externas instaladas globalmente (Jun 2026)
Instaladas diretamente em `C:\Users\Utilizador\.claude\skills\` — não estão neste repositório.

| Pacote | Skills | Fonte |
|--------|--------|-------|
| **gstack** (garrytan/gstack) | 50+ skills: office-hours, plan-ceo-review, plan-eng-review, plan-design-review, autoplan, review, ship, land-and-deploy, qa, qa-only, browse, scrape, cso, design-consultation, design-shotgun, design-html, design-review, investigate, health, document-generate, document-release, make-pdf, retro, spec, codex, freeze, guard, careful, learn, context-save, context-restore, benchmark, canary, devex-review, diagram, skillify, pair-agent, ios-fix, ios-qa, ios-design-review, ios-sync, ios-clean, setup-deploy, setup-gbrain, setup-browser-cookies, sync-gbrain, gstack-upgrade | github.com/garrytan/gstack |
| **stop-slop** (hardikpandya/stop-slop) | stop-slop | github.com/hardikpandya/stop-slop |
| **last30days** (mvanhorn/last30days-skill) | last30days | github.com/mvanhorn/last30days-skill |
| **taste-skill** (Leonxlnx/taste-skill) | taste-skill, taste-skill-v1, minimalist-skill, brutalist-skill, soft-skill, redesign-skill, image-to-code-skill, stitch-skill, brandkit, output-skill, imagegen-frontend-web, imagegen-frontend-mobile | github.com/Leonxlnx/taste-skill |
| **hyperframes** (heygen-com/hyperframes) | hyperframes, hyperframes-core, hyperframes-animation, hyperframes-creative, hyperframes-media, hyperframes-cli, hyperframes-registry, general-video, product-launch-video, website-to-video, pr-to-video, faceless-explainer, motion-graphics, music-to-video, slideshow, embedded-captions, graphic-overlays, media-use, remotion-to-hyperframes | github.com/heygen-com/hyperframes |

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

**4. b2b-outbound-automation — extraída de transcrição de masterclass**
Sessão de 02/06/2026 do ISCTE Executive Education (pós-graduação IA para Gestão).
Conteúdo extraído sem nomes de clientes ou informação confidencial.
Framework dos 4 blocos: infraestrutura de email → TAM + lead scoring → intent data → sequenciadores multicanal. Inclui o padrão "operating system" para agentes (regras lidas antes de cada ação) e a regra de human-in-the-loop antes de qualquer envio.

### Estado após sessão (Jul 2026 — sessão 3)
- **127+ skills ativas** em `C:\Users\Utilizador\.claude\skills\` (Windows local)
- **100 skills ativas** no ambiente remoto Claude Code
- **44 skills** neste repositório (após otimização 30 Jun + adições Jul 2026)
- 5 pacotes externos instalados globalmente (gstack, stop-slop, last30days, taste-skill, hyperframes)
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

**Skills estendidas:**
- `agent-prompt-builder` — adicionada secção no-code app builders (Lovable/Bolt/v0): hand-off package structure, template completo de prompt, quality check, anti-patterns (Jul 2026)

**Otimização de routing (30 Jun 2026):**
- Removida `loop` (absorvida em `loop-engineering`)
- Removida `prompt-builder` (estava vazia)
- Descriptions afinadas: `review` (só prosa/docs), `loop-engineering` e `self-improving-loop` (boundaries explícitos entre si)

**Comando `/analyze`:**
- Criado em `~/.claude/commands/analyze.md` e em `commands/analyze.md` no repo
- Lê o projeto, mapeia skills relevantes, aplica-as com análise real
- Nota: funciona no Claude Code CLI; no Antigravity IDE usar linguagem natural ("analisa este projeto")

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
