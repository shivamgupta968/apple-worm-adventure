@echo off
echo Installing backend...
cd server
call npm install
if not exist .env copy .env.example .env
start "Apple Worm Backend" cmd /k "npm run dev"
cd ..\client
call npm install
if not exist .env copy .env.example .env
start "Apple Worm Frontend" cmd /k "npm run dev"
