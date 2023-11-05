@echo off
cls
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
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3

echo Opcao invalida Escolha outra opcao do menu.
pause
goto menu

:opcao1
cls
set folderPath=C:\Users\kemue\Desktop\Projeto Faculdade\helpdesk-faculdade
echo ======================================
echo *      Iniciado Servidor Django            *
echo ======================================
start cmd /k "cd /d "%folderPath%" & env\Scripts\activate & python manage.py runserver"
start http://127.0.0.1:8000/login
pause
goto menu   


:opcao2
cls
set folderPath=C:\Users\kemue\Desktop\Projeto Faculdade\helpdesk-faculdade
echo ======================================
echo *      Fechar Servidor            *
echo ======================================
taskkill /im python.exe /f
pause
goto menu   

:opcao3
cls
exit
