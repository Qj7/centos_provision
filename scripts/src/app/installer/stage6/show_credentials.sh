#!/usr/bin/env bash
#





show_credentials(){
  print_with_color "http://${VARS['license_ip']}/admin" 'light.green'
  if isset "${VARS['db_restore_path']}"; then
    echo "$(translate 'messages.successful.use_old_credentials')"
  else
    colored_login=$(print_with_color "${VARS['admin_login']}" 'light.green')
    colored_password=$(print_with_color "${VARS['admin_password']}" 'light.green')
    echo -e "login: ${colored_login}"
    echo -e "password: ${colored_password}"
  fi
  echo "$(translate 'messages.successful.how_to_enable_ssl')"
}
