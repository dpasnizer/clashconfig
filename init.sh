#!/bin/bash
clear

URL="https://raw.githubusercontent.com/dpasnizer/clashconfig/main"
COMMAND="all, proxy, rule, update"

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


if [ "$1" = "rule" ] || [ "$1" = "all" ]; then
  # rule provider
  echo "Fetching rule provider.."
  get adult.yaml "${URL}/rule_provider/adult.yaml"
  get direct.yaml "${URL}/rule_provider/direct.yaml"
  get facebook.yaml "${URL}/rule_provider/facebook.yaml"
  get games.yaml "${URL}/rule_provider/games.yaml"
  get instagram.yaml "${URL}/rule_provider/instagram.yaml"
  get reject.yaml "${URL}/rule_provider/reject.yaml"
  get tiktok.yaml "${URL}/rule_provider/tiktok.yaml"
  get twitter.yaml "${URL}/rule_provider/twitter.yaml"
  get whatsapp.yaml "${URL}/rule_provider/whatsapp.yaml"
  get youtube.yaml "${URL}/rule_provider/youtube.yaml"
  echo ""
fi

if [ "$1" = "proxy" ] || [ "$1" = "all" ]; then
  # proxy provider
  echo "Fetching proxy provider.."
  get proxies.yaml "${URL}/proxy_provider/proxies.yaml"
  echo ""
fi

if [[ "$COMMAND" != *"$1"* ]]; then
  echo "ERROR: $1 is an invalid option"
  echo ""
fi

echo "DONE!"
exit 0
