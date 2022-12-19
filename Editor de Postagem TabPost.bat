@echo off

:main
cls
echo Editor de Postagem TabPost
echo -------------------------
echo 1. Titulo do Post
echo 2. Corpo do Post
echo 3. Postar
echo 4. Sair
echo -------------------------
set /p choice=Entre com um Numero: 

if %choice%==1 goto titulo
if %choice%==2 goto corpo
if %choice%==3 goto postar
if %choice%==4 goto exit

:titulo
cls
echo Pressione Ctrl+Z quando terminar.
set /p code=
goto main

:corpo
cls
echo Pressione Ctrl+Z quando terminar.
set /p codea=
goto main

:postar
cls
echo.
echo E-mail:
echo.
@set /p mail=
echo.
echo Senha:
echo.
@set /p pass=
set baseurl=https://www.tabnews.com.br/api/v1
curl -i -c cookies.txt -X POST -d "email=%mail%&password=%pass%" %baseurl%/sessions
curl -i -b cookies.txt -X POST -d "title=%code%&body=%codea%&status=published" %baseurl%/contents
cls
echo.
echo.
echo POSTAGEM FEITA :)
echo.
echo.
pause
goto exit


:exit
cls
echo Fechando...
