-- lovable-cron-fallback-reviewed: 1440 runs/day; required for roulette signal monitoring with a maximum one-minute delay while avoiding repeated empty reads.
SELECT cron.unschedule('roulette-column-watch');

SELECT cron.schedule(
  'roulette-column-watch',
  '* * * * *',
  $cron$
  SELECT net.http_get(
    url := 'https://column-watcher.lovable.app/api/public/roulette/check?run=' || extract(epoch from clock_timestamp())::bigint::text,
    headers := '{"Cache-Control":"no-cache"}'::jsonb,
    timeout_milliseconds := 55000
  ) AS request_id;
  $cron$
);