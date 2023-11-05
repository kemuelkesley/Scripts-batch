@echo off
cls

setlocal enabledelayedexpansion

:menu
cls
color 0a
date /t

echo Computador: %computername%        Usuario: %username%
                   
echo            MENU 
echo  ===============================================
echo * 1. Digitar o caminho da pasta do projeto   * 
echo * 2. Instalar ambiente virtual               *
echo * 3. Ativar ambiente virtual                 * 
echo * 4. Instalar dependencias                   *
echo * 5. Rodar migracoes                         *
echo * 6. Criar Administrador                     *
echo * 7. Rodar Servidor Django                   *
echo * 8. Fechar Servidor                         *
echo * 9. Sair                                    * 
echo  ==============================================

set /p opcao=Escolha uma opcao: 
echo ------------------------------

if %opcao% equ 1 (
    set /p folderPath=Digite o caminho da pasta do projeto: 
) else if %opcao% equ 2 (
    echo ===============================================================
    echo *      Instalando ambiente virtual            *
    echo ===============================================================
    pushd "!folderPath!"
    ::pip install virtualenv
    python -m venv env
    virtualenv env
    popd
) else if %opcao% equ 3 (
    echo ================================================================
    echo *      Ativando ambiente virtual              *
    echo ================================================================
    call "!folderPath!\env\Scripts\activate"
    set ambiente_ativo=1
    timeout /t 2
)

if defined ambiente_ativo (
    if %opcao% equ 4 (
        echo ===============================================================
        echo *      Instalando dependências                *
        echo ===============================================================
        pip install -r "!folderPath!\requirements.txt"
    ) else if %opcao% equ 5 (
        echo ===============================================================
        echo *      Rodando migrate                        *
        echo ===============================================================
        cd /d "!folderPath!" & python manage.py migrate
    ) else if %opcao% equ 6 (
        echo ===============================================================
        echo *      Criando superusuário                   *
        echo ===============================================================
        start cmd /k "cd /d "!folderPath!" & python manage.py createsuperuser"
    ) else if %opcao% equ 7 (
        echo ===============================================================
        echo *      Iniciando Servidor Django              *
        echo ===============================================================
        start cmd /k "cd /d "!folderPath!" & python manage.py runserver"
        start http://127.0.0.1:8000/login/
        pause
    ) else if %opcao% equ 8 (
        echo ================================================================
        echo *      Fechando Servidor                      *
        echo ================================================================
        pushd "!folderPath!"
        taskkill /im python.exe /f
        popd
        pause
    ) else if %opcao% equ 9 (
        cls
        exit
    ) else (
        echo Opcao invalida. Escolha outra opcao do menu.
        pause
    )
) 
goto menu
