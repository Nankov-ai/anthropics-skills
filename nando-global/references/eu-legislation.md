---
name: aiact
description: Referência completa sobre legislação europeia de IA para PMEs portuguesas. Usa esta skill sempre que o utilizador perguntar sobre AI Act, RGPD aplicado a IA, compliance de IA, obrigações legais de chatbots/agentes, direitos de autor em conteúdo gerado por IA, DSA/DMA, multas, ou responsabilidade de Providers vs Deployers. Contexto: SaaS B2B, marketing digital, agentes de IA, mercado português.
---

# Legislação Europeia de IA — Referência Completa

> Fonte: AI Act (Regulamento UE 2024/1689), RGPD (Regulamento UE 2016/679), DSA/DMA, análise especializada (Pedro Vale Gonçalves).
> Contexto: PMEs portuguesas, SaaS B2B, marketing digital, agentes de IA.

---

## 1. Abordagem Baseada no Risco (AI Act)

A legislação europeia **não proíbe IA de forma cega** — classifica-a pelo risco para os cidadãos:

### Risco Inaceitável (Proibido)
Sistemas totalmente proibidos na UE:
- Social scoring (pontuação social de cidadãos)
- Manipulação de comportamento por mensagens subliminares
- Reconhecimento de emoções em locais de trabalho e escolas
- Biometria em tempo real em espaços públicos (com exceções estreitas)

### Alto Risco
Sistemas que tomam decisões críticas com impacto significativo:
- Aprovação de créditos financeiros
- Triagem de currículos / recrutamento automatizado
- Sistemas de educação e formação profissional
- Infraestruturas críticas

**Obrigações**: processos pesados de compliance, auditorias rigorosas, supervisão humana obrigatória (human oversight) — a máquina não pode decidir sozinha.

### Risco Limitado
Maioria das atividades de marketing e apoio ao cliente:
- Chatbots e assistentes virtuais
- Geração de imagens, áudio e vídeo
- Clonagem de voz

**Regra de ouro**: **transparência obrigatória** perante o utilizador final.

### Risco Mínimo
Ferramentas internas, filtros de spam, IA em jogos.
**Obrigação**: boas práticas + literacia das equipas.

---

## 2. Criação de Apps e Agentes (Chatbots)

### Aviso Obrigatório ao Utilizador
- O utilizador **tem de ser informado claramente** que está a interagir com IA e não com um humano.
- O aviso não precisa de ser a primeira frase, mas deve ser **perfeitamente percetível** para o consumidor comum.
- Pode estar na interface do chat (ex: "Este assistente é alimentado por IA").

### Responsabilidade por Alucinações
- Se um chatbot prometer algo incorreto (ex: devolução de dinheiro, produto gratuito), a **responsabilidade é da empresa que faz deploy** — não do provider do LLM.
- Caso real: Air Canada foi obrigada a cumprir uma promessa feita pelo seu chatbot em tribunal.
- **Implicação para Nodeflow**: os clientes do VisionAI+ devem ser informados desta responsabilidade contratualmente.

### Cadeia de Responsabilidade
- A responsabilidade de informar o consumidor final e garantir o disclaimer recai sobre a **marca/empresa que interage com o cliente** — não sobre a agência ou fornecedor de tecnologia.
- Se a Nodeflow cria um agente para um cliente, o cliente é o Deployer responsável perante o consumidor.

### Providers vs. Deployers
| Papel | Quem é | Responsabilidade |
|---|---|---|
| **Provider** | OpenAI, Anthropic, Google | Conformidade do modelo base |
| **Deployer** | Empresa que usa o modelo num caso de uso | Conformidade da aplicação final |
| **Caso especial** | Empresa TI que cria servidor próprio com LLM para vender | Assume responsabilidades de Provider |

---

## 3. Uso de LLMs e RGPD

### Fuga de Dados Sensíveis
- É **ilegal e perigoso** colocar dados de clientes, contratos confidenciais ou informação pessoal em prompts de ferramentas como ChatGPT.
- Ao fazê-lo, a empresa partilha dados com terceiros (frequentemente fora da UE), violando o RGPD.
- **Regra prática**: nenhum dado identificável de clientes em prompts externos. Usar pseudonimização ou dados sintéticos.

### Políticas e Guardrails Internos
As empresas são obrigadas a ter:
- Guias de Boas Práticas para uso de IA pelos colaboradores
- Procedimentos claros documentados
- Bloqueios técnicos (guardrails) para impedir uso indevido
- Sistema de governo interno de IA

### Literacia Obrigatória (desde fevereiro de 2025)
O AI Act exige que as empresas implementem **programas obrigatórios de literacia em IA** para colaboradores — para que não possam alegar "desconhecimento" em caso de uso indevido.

---

## 4. Geração de Conteúdo e Direitos de Autor

### Identificação de Conteúdo Gerado por IA
Se a empresa gerar imagens, áudio ou vídeo com IA, especialmente se:
- Manipular a imagem de uma pessoa
- Criar deepfakes
- Abordar temas de interesse público

→ **Obrigatório**: disclaimer, aviso visual ou marca de água a informar que o conteúdo é artificial.

### Propriedade Intelectual
- Uma obra gerada **100% por um LLM** ou gerador de imagem **não tem proteção de Direitos de Autor**.
- Para proteger legalmente, é obrigatório haver um **"toque humano substancial e criativo"** no processo.
- Risco adicional: muitas ferramentas foram treinadas com scraping de conteúdos protegidos — potencial exposição legal.

---

## 5. DSA / DMA — Mercados e Serviços Digitais

### Digital Services Act (DSA)
- Obriga plataformas a serem transparentes sobre recomendações algorítmicas.
- Proíbe publicidade dirigida a menores ou baseada em dados sensíveis.
- Exige mecanismos de reporte de conteúdo ilegal.
- Aplicável a plataformas com presença na UE (mesmo que sediadas fora).

### Digital Markets Act (DMA)
- Regula "gatekeepers" (grandes plataformas: Google, Meta, Apple, etc.).
- Impede práticas anticoncorrenciais digitais.
- Relevante para Nodeflow ao integrar com plataformas sujeitas ao DMA (ex: Google Workspace, LinkedIn).

---

## 6. Multas e Prazos

| Infração | Multa Máxima |
|---|---|
| Sistemas proibidos (risco inaceitável) | 35M€ ou 7% faturação global |
| Violação de obrigações gerais do AI Act | 15M€ ou 3% faturação global |
| Informação incorreta à autoridade | 7,5M€ ou 1% faturação global |
| RGPD — infração grave | 20M€ ou 4% faturação global |

### Postura Recomendada
Não agir por medo das multas ou à espera dos prazos limite — adotar uma **postura ética e responsável desde já**:

1. Inventariar todas as ferramentas de IA em uso na empresa.
2. Treinar equipas para verificar sempre a informação gerada (human in the loop).
3. Implementar transparência em campanhas de marketing com conteúdo gerado.
4. Documentar todas as decisões de implementação de IA.

---

## 7. Checklist de Compliance por Caso de Uso

### Lançar um Chatbot / Agente (ex: VisionAI+)
- [ ] Aviso visível de interação com IA
- [ ] Política de limitação de responsabilidade definida
- [ ] Contrato com cliente (Deployer) clarifica responsabilidades
- [ ] Sem dados pessoais de clientes finais nos prompts
- [ ] Human override disponível para decisões críticas

### Campanha de Marketing com Conteúdo Gerado por IA
- [ ] Disclaimer em imagens/vídeos gerados por IA
- [ ] Sem publicidade dirigida a menores via algoritmo
- [ ] Direitos autorais verificados (toque humano no conteúdo)
- [ ] Sem uso de dados pessoais em prompts externos

### Automatização Interna (N8N, workflows)
- [ ] Dados de clientes pseudonimizados antes de entrar em LLMs externos
- [ ] Log de decisões automatizadas para auditoria
- [ ] Supervisão humana definida para outputs críticos

---

## 8. Recursos e Referências

- [AI Act — Texto oficial EUR-Lex](https://eur-lex.europa.eu/legal-content/PT/TXT/?uri=CELEX:32024R1689)
- [RGPD — CNPD Portugal](https://www.cnpd.pt)
- [DSA — Comissão Europeia](https://digital-strategy.ec.europa.eu/pt/policies/digital-services-act-package)
- [AI Office — Supervisão do AI Act](https://digital-strategy.ec.europa.eu/pt/policies/ai-office)
