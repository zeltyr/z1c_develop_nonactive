cd "../../tests/vrunner json/"
call vrunner xunit --settings vrunner_ext.json
"C:\Program Files\1cv8\8.3.20.1613\bin\1cv8c.exe" enterprise /S"Server_name\base_name" /N"Username" /P"" /Execute "C:\vanessa-automation\vanessa-automation.epf" /TESTMANAGER /C"StartFeaturePlayer;VAParams=C:\vanessa_json\vanessa.json"

cd "../../build/"
call allure generate --clean allure -o html_report
call allure open html_report