---
name: agent-reasoning
description: >
  Guia de referência para escolher e aplicar estratégias de raciocínio em agentes de IA.
  16 estratégias em 4 famílias, com benchmarks e casos de uso.
  ATIVAR quando: construir ou otimizar um agente, escolher estratégia de prompting,
  melhorar qualidade de respostas, resolver problemas de raciocínio, cálculo ou pesquisa.
  SUGERIR PROATIVAMENTE quando o utilizador estiver a treinar ou depurar um agente.
---

# Agent Reasoning — 16 Estratégias

> Fonte: Oracle Developers Blog (Nacho Martinez, 2026). Benchmarks: 4.200 avaliações, qwen3 modelo base.

## Resultado Rápido (escolha por defeito)
- **Geral**: `+cot` (CoT — 88.7% avg)
- **Ferramentas / dados externos**: `+react`
- **Matemática / puzzles**: `+tot` ou `+self_consistency`
- **Escrita de qualidade**: `+refinement_loop`
- **Não sabes qual**: `+auto` (Auto-Router decide)

---

## Família 1 — Sequential
*Alta velocidade, baixa latência. Ideal para passos lineares.*

| Estratégia | Quando usar |
|---|---|
| **Chain of Thought (CoT)** | Melhor estratégia geral. Raciocínio passo a passo. Palavras-problema, lógica, multi-step. |
| **Decomposed Prompting** | Problema com partes genuinamente separáveis (viagens, relatórios multi-secção). |
| **Least-to-Most** | Perguntas que exigem pré-requisitos: do simples para o complexo, acumulando contexto. |

---

## Família 2 — Branching
*Explora múltiplos caminhos. Melhor precisão, maior latência (5-8× mais lento).*

| Estratégia | Quando usar |
|---|---|
| **Tree of Thoughts (ToT)** | Puzzles, decisões estratégicas, problemas com múltiplas soluções válidas. +10% vs CoT. |
| **Self-Consistency** | Perguntas de escolha múltipla; quando chegar à resposta por vários caminhos é mais importante que velocidade. |

---

## Família 3 — Reflective
*O modelo revê e melhora a própria resposta.*

| Estratégia | Quando usar |
|---|---|
| **Self-Reflection** | Escrita criativa, explicações técnicas. Itera até "CORRECT" (máx. 5 vezes). |
| **Adversarial Debate** | Política, ética, análise ambígua. Dois agentes (PRO/CON) + juiz sintetiza. |
| **Refinement Loop** | Documentação, blog posts, outputs de produção. Métricas de qualidade objetivas guiam iteração. |

---

## Família 4 — Meta / Cross-Domain
*Roteamento automático e transferência de conhecimento entre domínios.*

| Estratégia | Quando usar |
|---|---|
| **Analogy-Based** | Problemas estruturalmente semelhantes a casos anteriores, mesmo em domínios diferentes. |
| **Socratic Questioning** | Filosofia, ensino, qualquer campo que exija "saber" e não só "responder". Pergunta até convergir. |
| **ReAct (Reason + Act)** | Fact-checking, eventos atuais, cálculos com dados externos, pesquisa web. Interleaves reasoning + ferramentas. |
| **Auto-Router** | Incerto sobre qual estratégia usar. O modelo classifica o input e escolhe automaticamente. |

---

## Benchmark (Março 2026)
| Estratégia | GSM8K | MMLU | ARC |
|---|---|---|---|
| CoT | 88.7% | 76% | 81% |
| ToT | 76.7% | — | — |
| Self-Consistency | 96.7% | 76.3% | — |
| ReAct | melhor em factual | — | — |

> As 5 estratégias generation-focused (Reflection, Debate, Refinement Loop, Analogy, Socratic) não são capturadas por benchmarks de escolha múltipla — avaliar qualitativamente.

---

## Padrão de Implementação (Ollama / API)
```python
# Drop-in replacement — só mudar o nome do modelo
client.generate(model="qwen3:27b+cot", prompt="...")
client.generate(model="qwen3:27b+react", prompt="...")
client.generate(model="qwen3:27b+auto", prompt="...")  # Auto-Router
```
