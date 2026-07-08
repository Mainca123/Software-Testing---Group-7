@echo off
setlocal EnableDelayedExpansion

title Clinic Management System
color 0A

echo.
echo ============================================================
echo              CLINIC MANAGEMENT SYSTEM
echo ============================================================
echo.

:: --------------------------------------------------
:: STEP 1
:: --------------------------------------------------
echo [1/7] Stopping old containers...
docker compose down -v --remove-orphans >nul 2>&1

echo.
echo [2/7] Building and starting containers...
docker compose up -d --build

if errorlevel 1 (
    echo.
    echo [ERROR] Docker Compose failed.
    pause
    exit /b 1
)

:: --------------------------------------------------
:: MYSQL CONTAINER ID
:: --------------------------------------------------

FOR /F %%i IN ('docker compose ps -q mysql') DO set MYSQL_CONTAINER=%%i

if "%MYSQL_CONTAINER%"=="" (
    echo.
    echo [ERROR] Cannot find MySQL container.
    pause
    exit /b 1
)

:: --------------------------------------------------
:: STEP 3
:: --------------------------------------------------

echo.
echo [3/7] Waiting for MySQL...

:WAIT_MYSQL

docker exec %MYSQL_CONTAINER% mysqladmin ping -hlocalhost -uroot -p123456 --silent >nul 2>&1

if errorlevel 1 (
    timeout /t 2 >nul
    goto WAIT_MYSQL
)

echo     MySQL is ready.

:: --------------------------------------------------
:: STEP 4
:: --------------------------------------------------

echo.
echo [4/7] Waiting for Backend...

:WAIT_BACKEND

curl -s http://localhost:8088/q/health >nul 2>&1

if errorlevel 1 (
    timeout /t 2 >nul
    goto WAIT_BACKEND
)

echo     Backend is ready.

:: --------------------------------------------------
:: STEP 5
:: --------------------------------------------------

echo.
echo [5/7] Waiting for database schema...

:WAIT_TABLE

docker exec %MYSQL_CONTAINER% mysql -uroot -p123456 -N -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='clinic_management' AND table_name='users';" > temp.txt

set /p TABLE_EXISTS=<temp.txt

del temp.txt

if "!TABLE_EXISTS!"=="1" (
    goto IMPORT_DB
)

timeout /t 2 >nul
goto WAIT_TABLE

:IMPORT_DB

echo     Tables detected.

echo.
echo Importing sample database...

docker exec -i %MYSQL_CONTAINER% mysql -uroot -p123456 clinic_management < db.sql

if errorlevel 1 (
    echo.
    echo [ERROR] Database import failed.
    pause
    exit /b 1
)

echo     Database imported successfully.

:: --------------------------------------------------
:: STEP 6
:: --------------------------------------------------

echo.
echo [6/7] Waiting for Frontend...

:WAIT_FRONTEND

curl -s http://localhost:3000 >nul 2>&1

if errorlevel 1 (
    timeout /t 2 >nul
    goto WAIT_FRONTEND
)

echo     Frontend is ready.

:: --------------------------------------------------
:: STEP 7
:: --------------------------------------------------

echo.
echo [7/7] Containers

docker ps


echo.
echo ===========================
echo SYSTEM STARTED SUCCESSFULLY
echo ===========================
echo.
echo.
echo.
echo.
echo =================================================
echo 		SYSTEM INFORMATION
echo =================================================
echo Swagger API: http://localhost:8088/api/v1/swagger
echo Frontend: http://localhost:3000
echo==================================================
pause