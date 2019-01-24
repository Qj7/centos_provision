#!/usr/bin/env bash
#






show_finishing_message(){
  local color=""
  if isset "$SUCCESSFUL_DOMAINS" && empty "$FAILED_DOMAINS"; then
    print_with_color "$(translate 'messages.successful')" 'green'
    print_enabled_domains
  fi
  if isset "$SUCCESSFUL_DOMAINS" && isset "$FAILED_DOMAINS"; then
    print_enabled_domains
    print_not_enabled_domains 'yellow'
  fi
  if empty "$SUCCESSFUL_DOMAINS" && isset "$FAILED_DOMAINS"; then
    print_not_enabled_domains 'red'
  fi
}


print_enabled_domains(){
  message="$(translate 'messages.ssl_enabled_for_domains')"
  domains=$(join_by ", " "${SUCCESSFUL_DOMAINS[@]}")
  print_with_color "OK. ${message} ${domains}" 'green'
}


print_not_enabled_domains(){
  local color="${1}"
  message="$(translate 'messages.ssl_not_enabled_for_domains')"
  domains=$(join_by ", " "${FAILED_DOMAINS[@]}")
  print_with_color "NOK. ${message} ${domains}" "${color}"
  print_with_color "$(cat "$SSL_ENABLER_ERRORS_LOG")" "${color}"
}
