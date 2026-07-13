---
name: co-intelligence
description: >
  Apply the Co-Intelligence framework (Ethan Mollick) to any task: classify it into the
  right collaboration mode (Solo, Delegated, Centaur, Cyborg) and suggest HOW to execute
  it in that mode. TRIGGER when the user is about to start a task and asks how to approach
  it with AI, when they seem to be fully delegating something that would benefit from human
  judgment, or when they ask "should I do this myself or use AI?", "how should we work on
  this together?", or "what's my role here?". Also trigger proactively when the task
  involves writing, creating, deciding, or designing — and the user has not specified their
  collaboration mode. Actively suggest Centaur or Cyborg over Delegated whenever possible.
  Do NOT use for purely technical tasks with no creative or judgment component.
---

# Co-Intelligence — Modos de Colaboração Humano-IA

Framework de Ethan Mollick (*Co-Intelligence*, 2024) para decidir como trabalhar com IA
em qualquer tarefa. O objetivo não é maximizar o uso de IA — é maximizar a qualidade do
output final, combinando o que humanos e IA fazem melhor.

## Os 4 Modos

### Solo — Só tu
O humano executa sem IA.

**Quando usar:**
- O processo de fazer é o que desenvolve a competência (aprender fazendo)
- A responsabilidade é intransferível (decisão ética, relação pessoal)
- A autenticidade é o produto (a tua voz genuína, a tua experiência vivida)
- A IA produziria algo genérico onde o específico é o valor

**Sinal de alerta:** Se estás a delegar algo que só tu podes saber ou sentir, para.

---

### Delegado — A IA faz, tu aprovs
A IA executa de forma autónoma. Tu defines o objetivo e validas o resultado.

**Quando usar:**
- Tarefas repetitivas com critério de qualidade claro (formatação, pesquisa inicial, resumos)
- Volume alto onde a revisão humana é mais eficiente do que a execução humana
- Baixo risco de erro não detetado

**Risco principal:** Aceitar output sem julgamento crítico. O modo delegado tende a
produzir resultados médios porque remove o teu conhecimento do processo.

**Regra:** Se não consegues avaliar a qualidade do output, não devia ser delegado.

---

### Centauro — Cada um faz a sua parte
Humano e IA trabalham em **secções separadas** da tarefa. Fronteira clara entre contribuições.

**Quando usar:**
- Tarefas com componentes distintos onde um requer julgamento e outro requer execução
- Escrita: tu fazes a estrutura e os argumentos centrais, a IA desenvolve secções de suporte
- Análise: tu defines o que é relevante, a IA processa e formata
- Criação: tu decides a direção criativa, a IA gera variações

**Como implementar:**
1. Divide a tarefa em blocos
2. Identifica quais blocos requerem o teu julgamento específico
3. Executa esses blocos primeiro
4. Delega os restantes com contexto claro do que já fizeste

---

### Ciborgue — Integração contínua
Humano e IA alternam **linha a linha**, sem fronteira definida. O output final é inseparável.

**Quando usar:**
- Tarefas de alta qualidade onde cada iteração melhora com o teu input
- Escrita onde a tua voz precisa de estar presente em todo o documento
- Decisões complexas onde queres pensar em voz alta com a IA
- Criação onde a direção emerge da conversa, não é definida antes

**Como implementar:**
- Começa com um fragmento teu (uma frase, uma ideia, uma direção)
- Pede à IA para continuar ou reagir
- Reage ao que a IA produziu — corrige, estende, redireciona
- Repete até o output ser genuinamente teu + IA, inseparável

**Sinal de que está a funcionar:** Não consegues dizer quem escreveu o quê.

---

## Como Sugerir o Modo Certo

Quando o utilizador apresenta uma tarefa, avalia estas dimensões:

| Dimensão | Favorece Solo/Centauro | Favorece Ciborgue/Delegado |
|---|---|---|
| Julgamento específico necessário? | Alto | Baixo |
| A tua voz importa no output? | Sim | Não |
| Consequências de erro? | Altas | Baixas |
| Volume da tarefa? | Baixo | Alto |
| Está a aprender algo? | Sim | Não |

**Regra de ouro:** O modo por defeito da maioria das pessoas é **Delegado**. Quase sempre
há uma versão **Centauro** ou **Ciborgue** que produz melhor resultado. Sugere sempre
esses modos antes de aceitar executar em modo delegado puro.

---

## Sugestão Proativa — Como Apresentar ao Utilizador

Quando identificas que o utilizador está prestes a delegar algo que beneficiaria de mais
integração, diz algo como:

> "Antes de eu fazer isto sozinho — esta tarefa tem [componente X] que tu conheces melhor
> do que eu. Sugestão: modo **Centauro** — tu fazes [parte A], eu faço [parte B].
> Ou modo **Ciborgue** — começas com [fragmento inicial] e iteramos juntos.
> Qual preferes, ou preferes mesmo que eu faça tudo?"

Dá sempre a opção de continuar em modo delegado — o utilizador decide. O teu papel é
garantir que a escolha é consciente, não por defeito.

---

## Aplicação a Criação de Skills

| Etapa | Modo recomendado |
|---|---|
| Decidir se a skill deve existir | Solo |
| Definir o scope e quando deve disparar | Centauro (tu defines, IA questiona) |
| Escrever a `description` | Ciborgue (iteração linha a linha) |
| Escrever o corpo do SKILL.md | Centauro ou Delegado |
| Validar se a skill funciona no contexto real | Solo |
