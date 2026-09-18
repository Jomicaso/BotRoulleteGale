# Deploy na Hostinger

Este projeto precisa de alojamento Node.js, porque usa rotas de servidor para o webhook do Telegram e para verificar a roleta.

## Hostinger

Usa a opção Node.js Web App, Web App, ou VPS com Node.js. Alojamento apenas estático não serve para este bot.

Configuração sugerida:

- Install command: `npm install`
- Build command: `npm run build`
- Start command: `npm run start`
- Output directory: deixa vazio se a Hostinger pedir apenas entry/start command
- Entry file: `.output/server/index.mjs`

## Variáveis de ambiente

Configura estas variáveis no painel da Hostinger, sem as colocar no GitHub:

```text
SUPABASE_URL=
SUPABASE_SERVICE_ROLE_KEY=
TELEGRAM_BOT_TOKEN=
TELEGRAM_WEBHOOK_SECRET=
```

`TELEGRAM_WEBHOOK_SECRET` pode ser qualquer texto longo e secreto criado por ti.

## Webhook do Telegram

Depois do site estar online, aponta o Telegram para:

```text
https://TEU-DOMINIO/api/public/telegram/webhook
```

Usa este URL no browser, trocando os valores:

```text
https://api.telegram.org/botTELEGRAM_BOT_TOKEN/setWebhook?url=https%3A%2F%2FTEU-DOMINIO%2Fapi%2Fpublic%2Ftelegram%2Fwebhook&secret_token=TELEGRAM_WEBHOOK_SECRET
```

## Cron da Supabase

Atualiza o cron para chamar o domínio novo:

```sql
SELECT cron.unschedule('roulette-column-watch');

SELECT cron.schedule(
  'roulette-column-watch',
  '* * * * *',
  $cron$
  SELECT net.http_get(
    url := 'https://TEU-DOMINIO/api/public/roulette/check?run=' || extract(epoch from clock_timestamp())::bigint::text,
    headers := '{"Cache-Control":"no-cache"}'::jsonb,
    timeout_milliseconds := 55000
  ) AS request_id;
  $cron$
);
```
