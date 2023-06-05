#!/bin/bash
clear
echo "Usage: ./clash [option]"
echo " - all       : Fetch all provider"
echo " - proxy     : Fetch proxy provider"
echo " - rule      : Fetch rule provider"
echo " - update    : Update this script to newest version"
echo ""

get () {
  if [ ! -n "$1" ] || [ ! -n "$2" ]; then
    echo " - ERROR"
    return 0
  fi

  echo -ne " - ...\r"
  CODE=$(curl -sSL -w '%{http_code}' -o $1 $2)
  if [[ "$CODE" =~ ^2 ]]; then
    echo " - $1"
  elif [[ "$CODE" = 404 ]]; then
    echo -ne "\r - $1 (ERROR: Not Found)"
    echo -ne "\n"
  else
    echo -ne "ERROR: server returned HTTP code $CODE"
    echo -ne "\n"
  fi
}

URL="https://raw.githubusercontent.com/dpasnizer/clashconfig/main"

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

# proxy provider
echo "Fetching proxy provider.."
get proxies.yaml "${URL}/proxy_provider/proxies.yaml"
echo ""

echo "DONE!"
