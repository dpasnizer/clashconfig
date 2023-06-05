#!/bin/bash

echo "Usage: ./clash [option]"
echo " proxy     Fetch proxy provider file(s)"
echo " rule      Fetch rule provider file(s)"
echo " update    Update this script to newest version"

URL="https://raw.githubusercontent.com/dpasnizer/clashconfig/main"

# rule provier
echo "${URL}/rule_provider/adult.yaml"
echo "${URL}/rule_provider/direct.yaml"
echo "${URL}/rule_provider/facebook.yaml"
echo "${URL}/rule_provider/games.yaml"
echo "${URL}/rule_provider/instagram.yaml"
echo "${URL}/rule_provider/reject.yaml"
echo "${URL}/rule_provider/tiktok.yaml"
echo "${URL}/rule_provider/twitter.yaml"
echo "${URL}/rule_provider/whatsapp.yaml"
echo "${URL}/rule_provider/youtube.yaml"

# proxy provider
echo "${URL}/proxy_provider/proxies.yaml"
