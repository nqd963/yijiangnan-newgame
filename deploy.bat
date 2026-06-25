@echo off
chcp 65001 >nul
echo ===================================
echo 忆江南·清秋晚 - 一键部署
echo ===================================

set PROJ=C:\Users\qingd\Desktop\yijiangnan-game
set SRC=C:\Users\qingd\AppData\Roaming\CherryStudio\Data\Agents\samk7mtkm\yijiangnan-site\index.html

:: 复制最新 index.html
copy /Y "%SRC%" "%PROJ%\index.html"
echo [OK] 已同步最新 index.html

:: 提交并推送
cd /d "%PROJ%"
git add index.html
git commit -m "update: %DATE% %TIME%"
git push
echo [OK] 已推送到 GitHub

:: 等待几秒让 Pages 部署
echo [等待 GitHub Pages 构建... 约30秒]
ping -n 5 127.0.0.1 >nul

:: 打开网页
start https://nqd963.github.io/yijiangnan-newgame/

echo ===================================
echo 完成！网页已自动打开。
echo 如未更新请等2分钟刷新。
echo ===================================
pause
