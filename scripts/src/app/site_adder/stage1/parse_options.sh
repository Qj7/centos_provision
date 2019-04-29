#!/usr/bin/env bash

parse_options(){
  while getopts "d:r:L:l:vhsp" option; do
    argument=$OPTARG
    case $option in
      d)
        VARS['site_domains']=$argument
        ensure_valid site_domains 'validate_domains_list'
        ;;
      r)
        VARS['site_root']=$argument
        ;;
      *)
        common_parse_options "$option" "$argument"
        ;;
    esac
  done
  ensure_options_correct
}


usage_ru(){
  print_err "Использование: "$SCRIPT_NAME" [OPTION]..."
  print_err "Попробуйте '${SCRIPT_NAME} -h' для большей информации."
  print_err
}


help_ru(){
  print_err "Использование: "$SCRIPT_NAME" [OPTION]..."
  print_err "$SCRIPT_NAME позволяет запустить дополнительный сайт совместно с Keitaro"
  print_err "Пример: "$SCRIPT_NAME" -l ru -d domain1.tld,domain2.tld -r /var/www/domain1.tld"
  print_err
  print_err "Автоматизация:"
  print_err "  -d DOMAIN_LIST           задать список доменов через запятую"
  print_err
  print_err "  -r PATH                  задать существующий путь к корневой директории сайта"
  print_err
}


usage_en(){
  print_err "Usage: "$SCRIPT_NAME" [OPTION]..."
  print_err "Try '${SCRIPT_NAME} -h' for more information."
  print_err
}


help_en(){
  print_err "Usage: "$SCRIPT_NAME" [OPTION]..."
  print_err "$SCRIPT_NAME allows to run additional site together with Keitaro"
  print_err "Example: "$SCRIPT_NAME" -l en -d domain1.tld,domain2.tld -r /var/www/domain1.tld"
  print_err
  print_err "Script automation:"
  print_err "  -d DOMAIN_LIST           set list of domains separated by comma"
  print_err
  print_err "  -r PATH                  set existent path to the site root"
  print_err
}
