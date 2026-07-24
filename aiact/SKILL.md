---
name: aiact
description: Referência completa sobre legislação europeia de IA. Usa esta skill para AI Act, RGPD, compliance, chatbots, DSA/DMA, multas, Providers vs Deployers, GPAI, classificação de risco, timelines de aplicação. União Europeia.
---

# Legislação Europeia de IA — AI Act & RGPD

## 1. Classificação de Risco (AI Act — Regulamento UE 2024/1689)

| Nível | Exemplos | Obrigação principal |
|---|---|---|
| **Proibido** | Social scoring, manipulação subliminar, reconhecimento facial em espaço público, sistemas que exploram vulnerabilidades, **reconhecimento de emoções no local de trabalho e em instituições de ensino** (Art. 5.1.f) | Não implementar. Proibição efectiva desde **Fev 2025** |
| **Alto Risco** | Aprovação de crédito, triagem de CVs, sistemas educativos, biométria, infra-estruturas críticas, aplicação da lei | Auditoria, registo, human oversight, documentação técnica, conformidade CE |
| **GPAI** (IA de Uso Geral) | GPT-4, Gemini, Claude, Llama — modelos de base | Transparência, registo, direitos de autor, avaliações de impacto sistémico (>10²⁵ FLOPs) |
| **Risco Limitado** | Chatbots, geração de imagens/texto/voz, deepfakes | Transparência obrigatória — utilizador deve saber que interage com IA |
| **Risco Mínimo / Baixo** | Filtros de spam, ferramentas internas de produtividade | Boas práticas voluntárias; sem obrigações legais específicas |

---

## 2. Timeline de Aplicação

| Data | O que entra em vigor |
|---|---|
| **Fev 2025** | Práticas proibidas (Art. 5) + Literacia em IA (Art. 4) — entram em vigor na mesma data |
| **Ago 2025** | Obrigações GPAI (Cap. V), estruturas de governance/autoridades nacionais (Cap. VII), regime de sanções (Cap. XII) |
| **Ago 2026** | Sistemas de Alto Risco (Anexo III) + restante maioria do Regulamento |
| **Ago 2027** | Sistemas de Alto Risco embutidos em produtos regulados existentes (Anexo I) |

**Correção (22 Jul 2026):** a versão anterior desta tabela tinha a Literacia em IA erradamente datada de Mai 2025 (correto: Fev 2025, junto com as proibições) e as obrigações GPAI erradamente agrupadas em Ago 2026 (correto: Ago 2025, um ano antes da maioria das obrigações de Alto Risco).

---

## 3. Provider vs Deployer — Quem é responsável?

| Papel | Quem é | Principais obrigações |
|---|---|---|
| **Provider** (Fornecedor) | Empresa que desenvolve/coloca no mercado o sistema de IA | Conformidade técnica, documentação, marcação CE, registo no EU AI database, monitorização pós-mercado |
| **Deployer** (Utilizador Profissional) | Empresa/entidade que usa o sistema de IA no contexto profissional | Human oversight, transparência para utilizadores finais, avaliação de impacto de direitos fundamentais (Alto Risco) |
| **Importador / Distribuidor** | Quem coloca no mercado UE sistemas de fora da UE | Verificação de conformidade do Provider |

**Regra prática para Nodeflow:**
- Quando a Nodeflow **constrói apps** com IA para clientes → é **Provider**
- Quando a Nodeflow **usa** ferramentas de IA (Gemini, GPT) nas suas apps → é **Deployer**
- O cliente que usa a app entregue pela Nodeflow → pode ser Deployer adicional

---

## 4. Obrigações para Sistemas de Alto Risco (a partir de Ago 2026)

1. **Gestão de Risco** — sistema contínuo de identificação, avaliação e mitigação
2. **Data Governance** — datasets de treino/validação/teste com qualidade, representatividade, sem discriminação
3. **Documentação Técnica** — antes de colocação no mercado (data sheet completa)
4. **Registo de Eventos (Logging)** — rastreabilidade automática das decisões do sistema
5. **Transparência** — instruções de uso claras para Deployers
6. **Supervisão Humana** — mecanismos que permitam override humano efectivo
7. **Exactidão, Robustez, Cibersegurança** — performance mensurável e auditável
8. **Registo no EU AI Database** — obrigatório antes do deploy

---

## 5. GPAI — Modelos de IA de Uso Geral

| Obrigação | Todos os GPAI | GPAI de Risco Sistémico (>10²⁵ FLOPs) |
|---|---|---|
| Documentação técnica | ✅ | ✅ |
| Política de direitos de autor | ✅ | ✅ |
| Sumário de dados de treino | ✅ | ✅ |
| Avaliações adversariais ("red-teaming") | ❌ | ✅ |
| Plano de gestão de incidentes | ❌ | ✅ |
| Reporte de incidentes graves à Comissão | ❌ | ✅ |
| Cibersegurança adequada | ❌ | ✅ |

**Nota:** Quem usa GPAI (Nodeflow usa Gemini) é Deployer, não Provider do modelo. As obrigações GPAI recaem sobre Google/OpenAI/Anthropic, e são aplicáveis desde **Ago 2025** (não Ago 2026 — ver correção na Secção 2).

---

## 6. Transparência Obrigatória — Art. 50

Para sistemas de **Risco Limitado** (chatbots, geração de conteúdo):

- Utilizador deve ser informado de que interage com IA — **em tempo real, não só nos T&C**
- Conteúdo gerado por IA (texto, áudio, vídeo, imagem) deve ser **marcado como tal** quando destinado ao público
- Excepção: uso autorizado (ex: investigação criminal) ou quando óbvio pelo contexto

**Apps Nodeflow com aviso já implementado:** NeoOtto, Alpha2026, O2C Reader, Logic Gate Trainer, Gestor de Quotas, Análise de Crédito, OutOfBox, NVisionAI+ ✅  
**Apps sem IA generativa (não precisam):** Notas de Despesa, Vocaliz, HealHour, English Adventure, Treino Ocular, Automagic Mail ✅  
**A verificar:** Faturix ⚠️

---

## 7. Multas

| Infração | Multa Máxima |
|---|---|
| Sistemas proibidos (Art. 5) | **35M€ ou 7%** da faturação global anual |
| Obrigações gerais AI Act (Alto Risco, GPAI) | **15M€ ou 3%** da faturação global anual |
| Informação falsa às autoridades | **7,5M€ ou 1%** da faturação global anual |
| RGPD (violações de dados pessoais) | **20M€ ou 4%** da faturação global anual |

PMEs e startups: sanções proporcionais (menor dos dois valores aplica-se).

---

## 8. Interplay AI Act ↔ RGPD

| Situação | RGPD | AI Act |
|---|---|---|
| Sistema de IA processa dados pessoais | ✅ Aplicável (base legal, minimização, direitos) | ✅ Aplicável se Alto Risco |
| Decisão automatizada com impacto significativo | Art. 22 RGPD (direito de não ser sujeito) | Alto Risco → human oversight obrigatório |
| Transparência sobre o sistema | Informação ao titular (Art. 13/14 RGPD) | Aviso de IA (Art. 50 AI Act) |
| Avaliação de impacto | DPIA (Art. 35 RGPD) | FRIA — Fundamental Rights Impact Assessment (Alto Risco, sector público) |
| Dados de treino com dados pessoais | Tratamento legítimo obrigatório | Data Governance (qualidade, representatividade) |

**Regra de ouro:** AI Act e RGPD são **cumulativos**, não alternativos. Cumprir um não dispensa o outro.

---

## 9. Governance de IA — Framework

Para organizações que desenvolvem ou deployam IA:

1. **Política de IA** — valores, princípios, âmbito de uso aceitável
2. **Inventário de sistemas de IA** — catalogar todos os sistemas em uso (nível de risco, papel: Provider/Deployer)
3. **Responsável de IA (AI Officer)** — pessoa/equipa responsável por compliance
4. **Literacia em IA** — formação obrigatória para utilizadores de sistemas de IA (Art. 4, desde Mai 2025)
5. **Monitorização contínua** — revisão periódica do risco e performance
6. **Registo de incidentes** — reportar incidentes graves (Alto Risco e GPAI sistémico)

---

## 10. Checklist — Apps com IA de Risco Limitado (apps Nodeflow)

- [ ] Aviso de IA visível ao utilizador antes/durante interacção
- [ ] Aviso não está só enterrado nos T&C
- [ ] Dados do utilizador não são enviados para prompts externos sem consentimento
- [ ] Conteúdo gerado com disclaimer quando partilhado publicamente
- [ ] App não toma decisões com impacto legal/económico significativo sem revisão humana
- [ ] API keys dos utilizadores (quando aplicável) não são armazenadas no servidor

## 11. Checklist — Se app evoluir para Alto Risco

- [ ] Avaliação de risco documentada
- [ ] Human oversight implementado (mecanismo de override)
- [ ] Logging de decisões activo
- [ ] Documentação técnica completa
- [ ] Registo no EU AI Database (antes do deploy)
- [ ] DPIA (RGPD) se dados pessoais envolvidos

---

## 12. Caso Prático — Air Canada (responsabilidade do Deployer)

Air Canada foi condenada a pagar indemnização porque o seu chatbot deu informação errada sobre política de reembolso. Decisão: o chatbot é responsabilidade da Air Canada, independentemente do fornecedor do modelo. **O Deployer responde pelas alucinações e erros da IA que deployou**, mesmo usando um modelo de terceiros.

Implicação para Nodeflow: ao entregar uma app com IA a um cliente, o cliente (Deployer) assume responsabilidade. Recomendar cláusula contratual que delimite responsabilidades e exija supervisão humana nas decisões com impacto real.
