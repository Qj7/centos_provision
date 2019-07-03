#!/usr/bin/env bash
DICT['en.errors.see_logs']="Evaluating log saved to ${SCRIPT_LOG}. Please rerun \`${SCRIPT_COMMAND}\` after resolving problems."
DICT['en.errors.domain_invalid']=":domain: doesn't look as valid domain"
DICT['en.certbot_errors.wrong_a_entry']="Please make sure that your domain name was entered correctly and the DNS A record for that domain contains the right IP address. You need to wait a little if the DNS A record was updated recently."
DICT['en.certbot_errors.too_many_requests']="There were too many requests. See https://letsencrypt.org/docs/rate-limits/."
DICT['en.certbot_errors.fetching']="There was connection error while issuing certificate. Try running the script again in an hour. If the error persists, contact support."
DICT['en.certbot_errors.unknown_error']="There was unknown error while issuing certificate, please contact support team"
DICT['en.messages.check_renewal_job_scheduled']="Check that the renewal job is scheduled"
DICT['en.messages.make_ssl_cert_links']="Make SSL certificate links"
DICT['en.messages.requesting_certificate_for']="Requesting certificate for"
DICT['en.messages.schedule_renewal_job']="Schedule renewal SSL certificate cron job"
DICT['en.messages.ssl_enabled_for_domains']="SSL certificates are issued for domains:"
DICT['en.messages.ssl_not_enabled_for_domains']="There were errors while issuing certificates for domains:"
DICT['en.warnings.nginx_config_exists_for_domain']="nginx config already exists"
DICT['en.warnings.certificate_exists_for_domain']="certificate already exists"
DICT['en.warnings.skip_nginx_config_generation']="skipping nginx config generation"

DICT['ru.errors.see_logs']="Журнал выполнения сохранён в ${SCRIPT_LOG}. Пожалуйста запустите \`${SCRIPT_COMMAND}\` после устранения возникших проблем."
DICT['ru.errors.domain_invalid']=":domain: не похож на домен"
DICT['ru.certbot_errors.wrong_a_entry']="Убедитесь что домен верный и что DNS A запись указывает на нужный IP адрес. Если A запись была обновлена недавно, то следует подождать некоторое время."
DICT['ru.certbot_errors.too_many_requests']="Было слишком много запросов, см. https://letsencrypt.org/docs/rate-limits/"
DICT['ru.certbot_errors.fetching']="Во время запуска произошла ошибка сети. Попробуйте запустить скрипт снова через час. Если ошибка повторится, обратитесь в службу поддержки."
DICT['ru.certbot_errors.unknown_error']="Во время выпуска сертификата произошла неизвестная ошибка. Пожалуйста, обратитесь в службу поддержки"
DICT['ru.messages.check_renewal_job_scheduled']="Проверяем наличие cron задачи обновления сертификатов"
DICT['ru.messages.make_ssl_cert_links']="Создаются ссылки на SSL сертификаты"
DICT['ru.messages.requesting_certificate_for']="Запрос сертификата для"
DICT['ru.messages.schedule_renewal_job']="Добавляется cron задача обновления сертификатов"
DICT['ru.messages.ssl_enabled_for_domains']="SSL сертификаты выпущены для сайтов:"
DICT['ru.messages.ssl_not_enabled_for_domains']="SSL сертификаты не выпущены для сайтов:"
DICT['ru.warnings.nginx_config_exists_for_domain']="nginx конфигурация уже существует"
DICT['ru.warnings.certificate_exists_for_domain']="сертификат уже существует"
DICT['ru.warnings.skip_nginx_config_generation']="пропускаем генерацию конфигурации nginx"
