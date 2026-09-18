# Corrigir definitivamente os alertas live

## Causa confirmada
- A leitura a cada 4 segundos fez o fornecedor bloquear o sistema com erro **429 (pedidos em excesso)**; desde as 10:18, quase todas as leituras live foram recusadas.
- Quando o sistema recuperou números acumulados, enviou várias mensagens seguidas; o próprio Telegram também respondeu com **429**, chegando por vezes apenas a 1 dos 2 destinos.
- O agendamento continuou marcado como “sucesso” porque apenas conseguiu iniciar a chamada, mesmo quando a leitura interna estava bloqueada.

## Correção
- Substituir as leituras agressivas por uma frequência segura durante o minuto, suficiente para detetar rapidamente uma nova bola sem voltar a provocar bloqueios.
- Quando o fornecedor responder 429, respeitar o tempo de espera indicado e não repetir imediatamente três vezes.
- Impedir duas execuções simultâneas, para que o mesmo número nunca gere alertas duplicados nem contagens erradas.
- Processar números recuperados por ordem para manter WIN/LOSS e Gales corretos, mas não enviar sinais antigos que já não dão tempo para jogar.
- Enviar as mensagens ao privado e ao canal através de uma fila curta, respeitando o limite do Telegram e repetindo apenas a entrega recusada pelo tempo indicado.
- Manter exatamente a entrada à segunda bola, os três Gales, o aviso “Analisando o próximo sinal, fique atento”, links, simulação e painel atuais.

## Verificação sem gastar mensagens de teste
- Confirmar nos registos live que as leituras deixaram de receber 429.
- Acompanhar um sinal real desde a segunda bola até à entrega confirmada em **2/2 destinos**.
- Confirmar que o ciclo automático seguinte continua ativo, sem mensagens acumuladas nem duplicadas.
- Só depois publicar a correção; não enviar mensagens artificiais ao Telegram.
