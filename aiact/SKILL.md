---
name: aiact
description: Referência completa sobre legislação europeia de IA. Usa esta skill para AI Act, RGPD, compliance, chatbots, DSA/DMA, multas, Providers vs Deployers, classificação de risco. União Europeia.
---

# Legislação Europeia de IA

## 1. Classificação de Risco (AI Act)
| Nível | Exemplos | Obrigação |
|---|---|---|
| Proibido | Social scoring, manipulação subliminar | Não implementar |
| Alto Risco | Aprovação de crédito, triagem de CVs | Auditoria + human oversight |
| Risco Limitado | Chatbots, geração de imagens | Transparência obrigatória |
| Risco Mínimo | Ferramentas internas, filtros de spam | Boas práticas |

## 2. Chatbots e Agentes
- Aviso obrigatório: utilizador deve saber que fala com IA
- Alucinações: responsabilidade é do Deployer, não do provider (caso Air Canada)
- Agência cria agente para cliente: cliente é o Deployer responsável

## 3. Multas
| Infração | Multa Máxima |
|---|---|
| Sistemas proibidos | 35M€ ou 7% faturação global |
| Obrigações gerais AI Act | 15M€ ou 3% faturação global |
| RGPD | 20M€ ou 4% faturação global |

## 4. Checklist
- [ ] Aviso de IA visível
- [ ] Supervisao humana definida
- [ ] Dados de clientes fora dos prompts externos
- [ ] Conteúdo gerado com disclaimer se público
