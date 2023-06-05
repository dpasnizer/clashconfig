#!/bin/bash

echo "Usage: ./clash [option]"
echo " - all       : Fetch all provider"
echo " - proxy     : Fetch proxy provider"
echo " - rule      : Fetch rule provider"
echo " - update    : Update this script to newest version"

URL="https://raw.githubusercontent.com/dpasnizer/clashconfig/main"

# rule provider
echo "Fetching rule provider.."
echo "- adult.yaml"
curl -sS -o adult.yaml "${URL}/rule_provider/adult.yaml"
echo "- direct.yaml"
curl -sS -o direct.yaml "${URL}/rule_provider/direct.yaml"
echo "- facebook.yaml"
curl -sS -o facebook.yaml "${URL}/rule_provider/facebodok.yaml"
echo "- games.yaml"
curl -sS -o games.yaml "${URL}/rule_provider/games.yaml"
echo "- instagram.yaml"
curl -sS -o instagram.yaml "${URL}/rule_provider/instagram.yaml"
echo "- reject.yaml"
curl -sS -o reject.yaml "${URL}/rule_provider/reject.yaml"
echo "- tiktok.yaml"
curl -sS -o tiktok.yaml "${URL}/rule_provider/tiktok.yaml"
echo "- twitter.yaml"
curl -sS -o twitter.yaml "${URL}/rule_provider/twitter.yaml"
echo "- whatsapp.yaml"
curl -sS -o whatsapp.yaml "${URL}/rule_provider/whatsapp.yaml"
echo "- youtube.yaml"
curl -sS -o youtube.yaml "${URL}/rule_provider/youtube.yaml"

# proxy provider
echo "${URL}/proxy_provider/proxies.yaml"

echo "DONE!"
