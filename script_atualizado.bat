@echo off
cls

setlocal enabledelayedexpansion

:menu
cls
color 0a
date /t

echo Computador: %computername%        Usuario: %username%
                   
echo            MENU 
echo  ==================================
echo * 1. Rodar Servidor Django         * 
echo * 2. Fechar Servidor               *
echo * 3. Sair                          * 
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------

if %opcao% equ 1 (
    set /p folderPath=Digite o caminho da pasta do projeto: 
    set "projectPath=!folderPath!"
    echo ======================================
    echo *      Iniciado Servidor Django            *
    echo ======================================
    start cmd /k "cd /d "!folderPath!" & env\Scripts\activate & python manage.py runserver"
    start http://127.0.0.1:8000/login
    pause
) else if %opcao% equ 2 (
    if not defined projectPath (
        echo Caminho do projeto nao definido. Execute a opcao 1 primeiro.
    ) else (
        echo ======================================
        echo *      Fechar Servidor            *
        echo ======================================
        pushd "!projectPath!"
        taskkill /im python.exe /f
        popd
    )
    pause
) else if %opcao% equ 3 (
    cls
    exit
) else (
    echo Opcao invalida. Escolha outra opcao do menu.
    pause
)
goto menu
