# Alertas Telegram em tempo real

## Objetivo
Fazer o bot reagir poucos segundos após cada resultado da roleta, sem esperar pelo minuto seguinte nem acumular vários sinais para enviar juntos.

## Alterações
- Manter a chamada automática por minuto, mas fazê-la acompanhar o feed durante quase todo o minuto, com uma nova leitura a cada poucos segundos.
- Em cada leitura, processar imediatamente todos os números ainda não vistos, por ordem, preservando a entrada ao segundo número da mesma coluna e os três Gales atuais.
- Impedir que uma falha temporária ou uma leitura vazia encerre toda a janela de acompanhamento.
- Repor a mensagem “🕵️ ANALISANDO O PRÓXIMO SINAL, FIQUE ATENTO 🧠💸”, com hora de Lisboa e links, uma vez após cada WIN ou LOSS.
- Não alterar a simulação, o painel, os valores, os destinos ou as restantes mensagens.

## Verificação
- Confirmar que a versão compila sem erros.
- Confirmar no serviço live que uma chamada acompanha várias leituras durante o minuto e atualiza o último número processado sem duplicações.
- Publicar a versão corrigida e confirmar que privado e canal continuam ativos, sem enviar mensagens artificiais de teste.
