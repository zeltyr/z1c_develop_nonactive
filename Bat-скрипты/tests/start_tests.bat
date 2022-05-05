cd "vrunner json/"
call vrunner xunit --settings vrunner_ext.json
call vrunner xunit --settings vrunner_tests.json

cd "../../build/"
call allure generate --clean allure -o html_report
call allure open html_report