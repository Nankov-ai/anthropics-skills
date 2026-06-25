---
name: termos-condicoes-pt
description: Gera, revê e adapta Termos & Condições para produtos digitais portugueses que usam Inteligência Artificial. Usa esta skill sempre que o utilizador pedir para criar, escrever, rever, adaptar ou atualizar T&C, termos de utilização, termos de serviço, política de uso ou documentos legais para uma app, portal, SaaS ou site com IA em Portugal ou na União Europeia. Também ativar quando o utilizador mencionar AI Act, Art. 50, consentimento de utilizadores, RGPD aplicado a IA, avisos legais de IA, ou quando estiver a lançar um produto digital que recolha dados ou use modelos de IA (Claude, Gemini, OpenAI, etc.). Não usar para contratos B2B, NDA, políticas de privacidade isoladas (sem T&C), ou legislação fora da UE.
---

# Termos & Condições para Produtos Digitais com IA — Portugal / UE

## Contexto e objetivo

Esta skill ajuda a criar T&C completos, legalmente sólidos e adaptados ao contexto específico do projeto. Os T&C gerados cobrem os requisitos da lei portuguesa, do RGPD e do AI Act da UE.

Antes de gerar, recolhe as seguintes informações do contexto do projeto (se não estiverem disponíveis, pede ao utilizador):

1. **Nome do produto/portal**
2. **Empresa operadora** — nome legal, NIF, morada, cidade
3. **Email de contacto legal**
4. **Tipo de produto** — portal SaaS, app móvel, site, plataforma B2B/B2C
5. **Modelos de IA usados** — ex: Claude (Anthropic), Gemini (Google), GPT (OpenAI)
6. **Funcionalidades com dados sensíveis** — fotos pessoais, biometria, dados financeiros, saúde
7. **Integrações terceiras** — redes sociais, CRMs, plataformas de pagamento
8. **Modelo de negócio** — gratuito, subscrição, créditos, freemium
9. **Processador de pagamentos** — ex: Stripe, SalesPark, Mollie
10. **Foro judicial** — cidade da sede da empresa operadora

---

## Estrutura dos T&C a gerar

Gera sempre todos os blocos abaixo, adaptando o conteúdo ao projeto. Usa linguagem clara, direta e em português de Portugal. Inclui o número da versão e data no cabeçalho (formato `vAAAA-MM-DD`).

### Cabeçalho
- Nome do produto e empresa operadora
- Data de última atualização e versão
- Frase de aceitação: "Ao criares conta ou ao utilizares [produto] aceitas integralmente estes Termos."

### 1. Conta e elegibilidade
- Idade mínima (normalmente 18 anos; se menores possível, adaptar)
- Responsabilidade pelas credenciais
- Obrigação de informação verdadeira

### 2. Uso aceitável
Lista de proibições — adaptar ao tipo de produto:
- Fins ilegais, fraudulentos ou contrários à ordem pública
- Conteúdo difamatório, discriminatório, sexualmente explícito ou violento
- Engenharia inversa, bots, scripts não autorizados
- Sobrecarga da infraestrutura / negação de serviço
- Violação de direitos de propriedade intelectual de terceiros

### 3. Conteúdo gerado pelo utilizador
- Propriedade do conteúdo é do utilizador
- Licença não-exclusiva e gratuita concedida ao operador para operar o serviço
- Prazo de eliminação após pedido (ex: 30 dias)

### 4. Inteligência Artificial ⚠️ AI Act Art. 50
Este bloco é **obrigatório** para qualquer produto com IA interativa:

```
O [produto] usa modelos de IA de terceiros ([lista de fornecedores]) para gerar 
texto, imagens ou outros conteúdos com base nas tuas instruções.

⚠️ Aviso (AI Act, Art. 50 — UE 2024/1689): O conteúdo gerado por IA pode conter 
imprecisões, factos incorretos ou bias. És responsável por rever, validar e adaptar 
qualquer output antes de o usar publicamente. O [empresa] não garante exatidão, 
originalidade ou aptidão para uso específico do conteúdo gerado.
```

Inclui também:
- Subsecção de conformidade com políticas dos fornecedores de IA (links para Google AI Policy, OpenAI Usage Policy, Anthropic AUP — conforme aplicável)
- Créditos/custos de geração (se aplicável)

### 5. Fotos pessoais e direitos de imagem (incluir se aplicável)
Apenas se o produto processar fotos ou biometria:
- 5.1 Fotos do próprio utilizador — garantias exigidas
- 5.2 Fotos de terceiros — autorização escrita obrigatória
- 5.3 Compromisso de uso adequado — proibição de deepfakes, manipulação enganosa
- 5.4 Em caso de violação — direitos do operador (suspensão, cooperação com autoridades, registo de evidências)
- 5.5 Sistema de takedown — email de contacto, prazo de resposta (ex: 5 dias úteis)
- 5.6 Aceitação registada — timestamp, IP, user-agent, versão dos termos

### 6. Integrações com plataformas terceiras (incluir se aplicável)
- Ligação sempre iniciada e autorizada pelo utilizador via OAuth
- Desligação disponível a qualquer momento (tokens eliminados imediatamente)
- Responsabilidade do utilizador pelos termos das plataformas terceiras
- Isenção do operador por mudanças de API ou políticas externas

### 7. Pagamentos e cancelamento (incluir se produto pago)
- Processador de pagamentos utilizado
- Renovação automática e cancelamento (prazo mínimo: 24h antes)
- Direito de livre resolução: 14 dias (art. 11.º DL 24/2014) se funcionalidade não utilizada
- Política de reembolsos fora do prazo

### 8. Suspensão e cancelamento
- Condições de suspensão (violação de termos, fraude, pagamentos em atraso, ordem judicial)
- Direito do utilizador de cancelar a qualquer momento
- Prazos de retenção de dados (remeter para Política de Privacidade)

### 9. Propriedade intelectual do produto
- Software, design, marca e código são propriedade do operador ou licenciadores
- Proibição de cópia ou utilização comercial sem autorização escrita

### 10. Limitação de responsabilidade
- Serviço fornecido "tal como está" e "como disponível"
- Lista de exclusões (lucros cessantes, indisponibilidades, conteúdo IA, ações de terceiros)
- Responsabilidade total limitada ao valor pago nos 12 meses anteriores

### 11. Lei aplicável e foro
- Lei portuguesa
- Foro: Tribunal Judicial da Comarca de [cidade da sede]
- Resolução alternativa: Centro de Arbitragem de Conflitos de Consumo de Lisboa (Lei n.º 144/2015, consumidor.gov.pt)

### 12. Alterações aos Termos
- Comunicação de alterações substanciais por email com 14 dias de antecedência
- Uso continuado implica aceitação

### 13. Contacto
- Empresa, morada completa, email legal

---

## Regras de geração

- Usa **negrito** para conceitos-chave e obrigações do utilizador
- Inclui sempre o bloco de AI Act (secção 4) — é obrigatório para qualquer produto com IA
- Omite as secções 5, 6 e 7 se o produto não tiver essas funcionalidades (não geras secções vazias)
- O foro judicial é sempre a cidade da sede da empresa operadora — nunca assumir uma cidade; perguntar se não estiver no contexto
- Nunca mencionar empresas ou produtos concorrentes por nome
- Versão dos termos no formato `vAAAA-MM-DD` (ex: `v2026-06-21`)
- Após gerar, pergunta: "Queres que adapte alguma secção ou que adicione cláusulas específicas ao teu contexto?"
