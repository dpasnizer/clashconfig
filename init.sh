#!/bin/bash
clear

URL="https://raw.githubusercontent.com/dpasnizer/clashconfig/main"
COMMAND="admin, all, client, proxy, rule, update"

if [ ! -n "$1" ]; then
  echo ""
  echo "Usage: ./clash [option]"
  echo " - all       : Fetch all provider"
  echo " - proxy     : Fetch proxy provider"
  echo " - rule      : Fetch rule provider"
  echo " - update    : Update this script to newest version"
  echo ""
  exit 1
fi

get () {
  echo -ne " - ...\r"

  if [ ! -n "$1" ] || [ ! -n "$2" ]; then
    echo " - ERROR, argument(s) required"
    return 0
  fi

  CODE=$(curl -sSL -w '%{http_code}' -o $1 $2)
  if [[ "$CODE" =~ ^2 ]]; then
    echo " - $1"
  elif [[ "$CODE" = 404 ]]; then
    echo " - $1 (ERROR: Not Found)"
  else
    echo "ERROR: server returned HTTP code $CODE"
  fi
}

# set user as admin
if [ "$1" = "admin" ]; then
  touch user.admin
fi

# set user as client
if [ "$1" = "client" ]; then
  rm -f user.admin
fi

# rule provider
if [ "$1" = "rule" ] || [ "$1" = "all" ]; then
  echo "Fetching rule provider.."
  get "etc/openclash/rule_provider/adult.yaml" "${URL}/rule_provider/adult.yaml"
  get "etc/openclash/rule_provider/direct.yaml" "${URL}/rule_provider/direct.yaml"
  get "etc/openclash/rule_provider/facebook.yaml" "${URL}/rule_provider/facebook.yaml"
  get "etc/openclash/rule_provider/games.yaml" "${URL}/rule_provider/games.yaml"
  get "etc/openclash/rule_provider/instagram.yaml" "${URL}/rule_provider/instagram.yaml"
  get "etc/openclash/rule_provider/reject.yaml" "${URL}/rule_provider/reject.yaml"
  get "etc/openclash/rule_provider/tiktok.yaml" "${URL}/rule_provider/tiktok.yaml"
  get "etc/openclash/rule_provider/twitter.yaml" "${URL}/rule_provider/twitter.yaml"
  get "etc/openclash/rule_provider/whatsapp.yaml" "${URL}/rule_provider/whatsapp.yaml"
  get "etc/openclash/rule_provider/youtube.yaml" "${URL}/rule_provider/youtube.yaml"
  echo ""
fi

# proxy provider
if [ "$1" = "proxy" ] || [ "$1" = "all" ]; then
  echo "Fetching proxy provider.."
  if [ -f "user.admin" ]; then
    if [ "$2" = "tester" ]; then
      get "etc/openclash/proxy_provider/tester.yaml" "${URL}/proxy_provider/proxies_tester.yaml"
      echo "   (TESTER proxies)"
    else
      get "etc/openclash/proxy_provider/proxies.yaml" "${URL}/proxy_provider/proxies_premium.yaml"
      echo "   (premium proxies)"
    fi
  else
    if [ ! -n "$2" ]; then
      get "etc/openclash/proxy_provider/proxies.yaml" "${URL}/proxy_provider/proxies_${2}.yaml"
    else
      get "etc/openclash/proxy_provider/proxies.yaml" "${URL}/proxy_provider/proxies.yaml"
    fi
  fi
  echo ""
fi

# self-update
if [ "$1" = "update" ]; then
  curl -sSL -o clash  "${URL}/init.sh" && chmod +x clash
fi

# option error
if [[ "$COMMAND" != *"$1"* ]]; then
  echo "ERROR: $1 is an invalid option"
  echo ""
fi

echo "DONE!"
exit 0
