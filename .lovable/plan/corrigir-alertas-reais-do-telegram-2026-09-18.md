# Corrigir alertas reais do Telegram

## Objetivo
Garantir que cada número novo é analisado e que sinais válidos chegam ao privado e ao canal, mesmo quando o feed falha temporariamente.

## Alterações
- Fazer uma única leitura robusta por minuto, em vez de dez leituras repetidas que frequentemente regressam vazias.
- Processar, por ordem, todos os números novos desde a última leitura, evitando perder sinais entre ciclos.
- Manter exatamente a regra atual: entrada após 2 números seguidos na mesma coluna e até 3 Gales.
- Manter mensagens, links, simulação e os dois destinos sem alterações.
- Registar claramente deteções e falhas de entrega para permitir confirmar alertas reais sem mensagens de teste.

## Validação
- Confirmar leitura live, atualização do último número processado e execução automática por minuto.
- Confirmar nos registos que cada sinal detetado tentou entrega nos dois destinos.
- Não enviar mensagens artificiais e não interromper o ciclo automático.
