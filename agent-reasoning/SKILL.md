---
name: agent-reasoning
description: >
  Guia de referência para escolher estratégias de raciocínio em agentes de IA.
  16 estratégias em 4 famílias, com benchmarks e casos de uso.
  ATIVAR quando: construir ou otimizar agente, escolher estratégia de prompting.
  SUGERIR PROATIVAMENTE quando o utilizador estiver a treinar ou depurar um agente.
---

# Agent Reasoning - 16 Estratégias

## Escolha Rápida
| Objetivo | Estratégia |
|---|---|
| Melhor geral | +cot - Chain of Thought (88.7%) |
| Ferramentas / dados externos | +react - ReAct |
| Matemática / puzzles | +tot ou +self_consistency |
| Escrita de qualidade | +refinement_loop |
| Incerto | +auto - Auto-Router |

## Família 1 - Sequential
| Chain of Thought | Melhor geral. Raciocínio passo a passo. |
| Decomposed Prompting | Partes genuinamente separáveis. |
| Least-to-Most | Do simples para o complexo. |

## Família 2 - Branching
| Tree of Thoughts | Puzzles, decisões estratégicas. +10% vs CoT. |
| Self-Consistency | Vários caminhos mais importante que velocidade. |

## Família 3 - Reflective
| Self-Reflection | Escrita criativa, explicações técnicas. |
| Adversarial Debate | Ética, análise ambígua. PRO + CON + juiz. |
| Refinement Loop | Documentação, outputs de produção. |

## Família 4 - Meta
| ReAct | Fact-checking, dados externos, pesquisa web. |
| Auto-Router | Incerto. Classifica o input e escolhe. |

## Benchmark (Março 2026)
| Estratégia | GSM8K | MMLU |
|---|---|---|
| CoT | 88.7% | 76% |
| Self-Consistency | 96.7% | 76.3% |
| ToT | 76.7% | - |
