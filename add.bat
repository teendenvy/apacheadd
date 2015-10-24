@echo off

::        o   ^__^
::         o  (oo)\_______
::            (__)\       )\/\
::                ||----w |
::                ||     ||


::配置目录	
set hostDir=D:\xampp\apache\conf\extra\project
set defaultWebpath=D:\web\
set vhostdir="D:\xampp\apache\conf\extra\httpd-vhosts.conf"
set hosts="C:\Windows\System32\drivers\etc\hosts"

	
echo please input domain:
set /p DOMAIN= 
echo domain is:%DOMAIN%
echo please input web folder,default path is %defaultWebpath%
set /p webpath=
IF EXIST %hostDir%\%webpath%.conf goto quit
	
echo webpath is:%defaultWebpath%%webpath%

:: 可以写入不同的配置	
echo ^<VirtualHost ^*:80^> > %hostDir%\%webpath%.conf
echo ServerAdmin admin@vunz.cn >> %hostDir%\%webpath%.conf
echo DocumentRoot %defaultWebpath%%webpath% >> %hostDir%\%webpath%.conf
echo ServerName %DOMAIN% >> %hostDir%\%webpath%.conf
echo DirectoryIndex index.php >> %hostDir%\%webpath%.conf
echo AddDefaultCharset UTF-8 >> %hostDir%\%webpath%.conf
echo ^<LocationMatch "/data/.*\.php$"^> >> %hostDir%\%webpath%.conf
echo Order Deny,Allow >> %hostDir%\%webpath%.conf
echo Deny from All >> %hostDir%\%webpath%.conf
echo ^</LocationMatch^> >> %hostDir%\%webpath%.conf
echo ^<Directory /^> >> %hostDir%\%webpath%.conf
echo AllowOverride ALL >> %hostDir%\%webpath%.conf
echo ^</Directory^> >> %hostDir%\%webpath%.conf
echo ^</VirtualHost^> >> %hostDir%\%webpath%.conf
	
echo Include "conf/extra/project/%webpath%.conf" >> %vhostdir%
	
echo apache conf write success
	
echo 127.0.0.1 %DOMAIN% >> %hosts%
echo hosts write success
PAUSE 
exit
	
:quit
echo %hostDir%\%webpath%.conf already exist 
PAUSE
exit


