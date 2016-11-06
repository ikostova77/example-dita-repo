set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_91
set DITA-OT-HOME=D:\work\DITA\OT\dita-ot-2.2.5
set HTML5-OUT-HOME=..\output\html
set PDF-OUT-HOME=..\output\pdf
set DITA-INPUT=..\dita\hierarchy.ditamap
for %%* in (.) do set CURR-DIR=%~p0

echo %CURR-DIR%
IF EXIST %HTML5-OUT-HOME% rmdir %HTML5-OUT-HOME% /S /Q
IF EXIST %PDF-OUT-HOME% rmdir %PDF-OUT-HOME% /S /Q
call %DITA-OT-HOME%\bin\dita -i %DITA-INPUT% -f html5 -o %HTML5-OUT-HOME% -d -l output-generation-html.log -propertyfile html5-output.properties
copy ..\css\*.jpg %HTML5-OUT-HOME%\css
call %DITA-OT-HOME%\bin\dita -i %DITA-INPUT% -f pdf2 -o %PDF-OUT-HOME% -d -l output-generation-pdf.log -propertyfile pdf2-output.properties