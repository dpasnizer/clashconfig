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
curl "${URL}/rule_provider/adult.yaml"
echo "- direct.yaml"
curl "${URL}/rule_provider/direct.yaml"
echo "- facebook.yaml"
curl "${URL}/rule_provider/facebook.yaml"
echo "- games.yaml"
curl "${URL}/rule_provider/games.yaml"
echo "- instagram.yaml"
curl "${URL}/rule_provider/instagram.yaml"
echo "- reject.yaml"
curl "${URL}/rule_provider/reject.yaml"
echo "- tiktok.yaml"
curl "${URL}/rule_provider/tiktok.yaml"
echo "- twitter.yaml"
curl "${URL}/rule_provider/twitter.yaml"
echo "- whatsapp.yaml"
curl "${URL}/rule_provider/whatsapp.yaml"
echo "- youtube.yaml"
curl "${URL}/rule_provider/youtube.yaml"

# proxy provider
echo "${URL}/proxy_provider/proxies.yaml"
