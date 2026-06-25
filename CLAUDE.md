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

## Skills neste repositório (43) + skills externas instaladas globalmente

### Skills desenvolvidas neste repositório (43)

| Skill | Origem |
|---|---|
| agent-prompt-builder | Original |
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
| loop | Criada sessão Jun 2026 |
| mcp-builder | Criada sessão Jun 2026 |
| pdf | Criada sessão Jun 2026 |
| pptx | Criada sessão Jun 2026 |
| prompt-builder | Criada sessão Jun 2026 |
| pt-checkout-builder | Criada de screenshot SalesPark checkout (Jun 2026) |
| review | Criada sessão Jun 2026 |
| run | Criada sessão Jun 2026 |
| schedule | Criada sessão Jun 2026 |
| security-review | Criada sessão Jun 2026 |
| simplify | Criada sessão Jun 2026 |
| skill-creator | Criada sessão Jun 2026 |
| skill-evaluator | Criada de whitepaper Agent Skills (Google/Anthropic, Mai 2026) |
| slack-gif-creator | Criada sessão Jun 2026 |
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

### Estado após sessão (Jun 2026 — sessão 2)
- **127+ skills ativas** em `C:\Users\Utilizador\.claude\skills\`
- 43 skills neste repositório de desenvolvimento
- 5 pacotes externos instalados globalmente (gstack, stop-slop, last30days, taste-skill, hyperframes)
- `graphifyy` instalado como CLI + CLAUDE.md configurado em 5 projetos (norauto-visionai+, Visionai+, OutOfBox, hiperfrio-o2c-rag, treino-e-diagnóstico-ocular)
- `/last30days` queries de mercado adicionadas ao CLAUDE.md dos mesmos 5 projetos
- VSCode tasks automáticas (graphify check on folder open) configuradas nos 5 projetos

## Convenções

- Descrições em inglês (melhor routing)
- Corpo do SKILL.md pode ser em PT ou EN consoante o contexto da skill
- Ficheiros de referência em `<skill>/references/`
- Nunca editar diretamente em `.claude\skills\` sem refletir a alteração aqui primeiro
