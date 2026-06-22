---
name: gem-builder
description: >
  Cria configurações completas de Google GEMs — agentes Gemini personalizados para Google Workspace. Usar para criar GEMs de RH, Vendas, Financeiro, Operações, Marketing, Jurídico, IT, Apoio ao Cliente, ou qualquer agente Gemini no ecossistema Google Workspace.
---

# Gem Builder

## Overview
Cria configurações completas de Google GEMs (agentes Gemini personalizados).

## Quando usar
- Utilizador quer criar um GEM do Google para qualquer departamento
- Pedido de "prompt para Gemini", "agente Google", "assistente para equipa"

## Estrutura de um GEM
1. **Nome** — curto, descritivo
2. **Instruções** — papel, missão, comportamento, formato de resposta
3. **Conhecimento** — ficheiros a fazer upload (opcional)
4. **Ferramentas** — Google Workspace (Drive, Gmail, Calendar, Docs)

## Limites do Gemini
- Prompt de sistema: ~8000 caracteres
- Sem referências a ferramentas externas não disponíveis
- Linguagem: preferir a língua do utilizador final

## Entregável
Ficheiro de configuração pronto a copiar para o Google Gemini Gems.
