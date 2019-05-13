#!/usr/bin/env bash
#






parse_options(){
  while getopts ":A:K:U:P:F:S:ra:t:i:k:L:l:hvps" option; do
    argument=$OPTARG
    ARGS["${option}"]="${argument}"
    case $option in
      A)
        VARS['license_ip']=$argument
        AUTO_INSTALL="true"
        ensure_valid A license_ip validate_ip
        ;;
      K)
        VARS['license_key']=$argument
        ensure_valid K license_key validate_license_key
        ;;
      U)
        VARS['admin_login']=$argument
        ensure_valid U admin_login "validate_alnumdashdot validate_not_reserved_word validate_starts_with_latin_letter"
        ;;
      P)
        VARS['admin_password']=$argument
        ensure_valid P admin_password "validate_alnumdashdot validate_not_reserved_word"
        ;;
      F)
        VARS['db_restore_path']=$argument
        ensure_valid F db_restore_path "validate_file_existence validate_keitaro_dump"
        ;;
      S)
        VARS['db_restore_salt']=$argument
        ensure_valid S db_restore_salt "validate_alnumdashdot"
        ;;
      r)
        RECONFIGURE="true"
        ;;
      a)
        CUSTOM_PACKAGE=$argument
        ;;
      t)
        ANSIBLE_TAGS=$argument
        ;;
      i)
        ANSIBLE_IGNORE_TAGS=$argument
        ;;
      k)
        case $argument in
          8|9)
            KEITARO_RELEASE=$argument
            ;;
          *)
            print_err "Specified Keitaro release '${argument}' is not supported"
            exit ${FAILURE_RESULT}
            ;;
        esac
        ;;
      *)
        common_parse_options "$option" "$argument"
        ;;
    esac
  done
  if isset "${ARGS['A']}" || isset "${ARGS['K']}"; then
    ensure_license_is_set
  fi
  if isset "${ARGS['U']}" || isset "${ARGS['P']}"; then
    ensure_license_is_set
  fi
  if isset "${ARGS['F']}" || isset "${ARGS['S']}"; then
    ensure_valid F db_restore_path validate_presence
    ensure_valid S db_restore_salt validate_presence
    ensure_license_is_set
  fi
  ensure_options_correct
}


ensure_license_is_set(){
  ensure_valid A license_ip validate_presence
  ensure_valid K license_key validate_presence
}


help_ru(){
  print_err "$SCRIPT_NAME уставливает и настраивает Keitaro"
  print_err "Пример: "$SCRIPT_NAME" -L ru -A a.b.c.d -K AAAA-BBBB-CCCC-DDDD -U some_username -P some_password"
  print_err
  print_err "Автоматизация:"
  print_err "  -A LICENSE_IP            задать IP адрес лицензии (обязательно наличие -K, выключает интерактивный режим)"
  print_err
  print_err "  -K LICENSE_KEY           задать ключ лицензии (обязательно наличие -A)"
  print_err
  print_err "  -F DUMP_FILEPATH         задать путь к дампу базы (обязательно наличие -S, -A и -K)"
  print_err
  print_err "  -S SALT                  задать salt при восстановлении из дампа (обязательно наличие -F, -A и -K)"
  print_err
  print_err "  -U ADMIN_USER            задать имя администратора (обязательно наличие -A и -K)"
  print_err
  print_err "  -P ADMIN_PASSWORD        задать пароль администратора (обязательно наличие -A и -K)"
  print_err
  print_err "  -r                       включить режим переконфигурации (несовместимо с -A)"
  print_err
  print_err "Настройка:"
  print_err "  -a PATH_TO_PACKAGE       задать путь к установочному пакету с архивом Keitaro"
  print_err
  print_err "  -t TAGS                  задать список ansible-playbook тегов, TAGS=tag1[,tag2...]"
  print_err
  print_err "  -i TAGS                  задать список игнорируемых ansible-playbook тегов, TAGS=tag1[,tag2...]"
  print_err
  print_err "  -k RELEASE               задать релиз Keitaro, поддерживается 8 и 9"
  print_err
}


help_en(){
  print_err "$SCRIPT_NAME installs and configures Keitaro"
  print_err "Example: "$SCRIPT_NAME" -L en -A a.b.c.d -K AAAA-BBBB-CCCC-DDDD -U some_username -P some_password"
  print_err
  print_err "Script automation:"
  print_err "  -A LICENSE_IP            set license IP (-K should be specified, disables interactive mode)"
  print_err
  print_err "  -K LICENSE_KEY           set license key (-A should be specified)"
  print_err
  print_err "  -F DUMP_FILEPATH         set filepath to dump (-S, -A and -K should be specified)"
  print_err
  print_err "  -S SALT                  set salt for dump restoring (-F, -A and -K should be specified)"
  print_err
  print_err "  -U ADMIN_USER            set admin user name (-A and -K should be specified)"
  print_err
  print_err "  -P ADMIN_PASSWORD        set admin password (-A and -K should be specified)"
  print_err
  print_err "  -r                       enables reconfiguration mode (incompatible with -A)"
  print_err
  print_err "Customization:"
  print_err "  -a PATH_TO_PACKAGE       set path to Keitaro installation package"
  print_err
  print_err "  -t TAGS                  set ansible-playbook tags, TAGS=tag1[,tag2...]"
  print_err
  print_err "  -i TAGS                  set ansible-playbook ignore tags, TAGS=tag1[,tag2...]"
  print_err
  print_err "  -k RELEASE               set Keitaro release, 8 and 9 are only valid values"
  print_err
}
