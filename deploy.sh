#!/bin/bash
# 把最新页面推送到 GitHub Pages（对外链接固定不变）
# 用法：bash deploy.sh          —— 改完内容后跑一次即可
set -e
cd "$(dirname "$0")"

URL="https://chenruipeng6931-maker.github.io/ai-anomaly-monitor/"

cp ai-anomaly-monitor.html index.html
touch .nojekyll
git add -A
if git diff --cached --quiet; then
  echo "没有改动，无需推送"
else
  git commit -q -m "更新页面 $(date '+%Y-%m-%d %H:%M')"
  git push -q origin main
  echo "已推送，约 1 分钟后生效：$URL"
fi
