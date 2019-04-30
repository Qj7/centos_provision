#!/usr/bin/env bash
DICT['en.errors.see_logs']="Evaluating log saved to ${SCRIPT_LOG}. Please rerun \`${SCRIPT_COMMAND}\` after resolving problems."
DICT['en.errors.vhost_already_exists']="Can not save site configuration - :vhost_filepath: already exists"
DICT['en.errors.site_root_not_exists']="Can not save site configuration - :site_root: directory does not exist"
DICT['en.prompts.site_domains']="${DICT['en.prompts.ssl_domains']}"
DICT['en.prompts.site_root']='Please enter site root directory'
DICT['en.prompt_errors.validate_directory_existence']="Directory :value: doesn't exist"

DICT['ru.errors.see_logs']="Журнал выполнения сохранён в ${SCRIPT_LOG}. Пожалуйста запустите \`${SCRIPT_COMMAND}\` после устранения возникших проблем."
DICT['ru.errors.vhost_already_exists']="Невозможно сохранить конфигурацию сайта - :vhost_filepath: уже существует"
DICT['ru.errors.site_root_not_exists']="Невозможно сохранить конфигурацию сайта - нет директории :site_root:"
DICT['ru.prompts.site_domains']="${DICT['ru.prompts.ssl_domains']}"
DICT['ru.prompts.site_root']='Укажите корневую директорию сайта'
DICT['ru.prompt_errors.validate_directory_existence']="Директория :value: не существует"
