echo off
echo Инициализация служебных переменных
set sec=4
Set ProgramPath="C:\Program Files\1cv8\8.3.17.1549\bin\1cv8.exe"
Set WorkHranPath="test2c\KIS_Hran"
Set TestHranPath="D:\1C_Bases\Тестовая разработка"
Set BackupWorkHranPath="D:\Buffer\КонфигурацияХранилища.cf"
Set BackupTestHranPath="D:\Buffer\КонфигурацияТестовойБазыДоОбновления.cf"
Set ConfigurationRepositoryPath="\\dc-01.geba.ru\shares\NET\common\IT\ОПиБТ\Vault1С"

Set Login="Вдовенко С."
Set LoginRep="Сергей"

Set LoginTest="АгентНовосибирск"
Set passwdtest=""

echo завершаем все сеансы 1С
taskkill /IM 1cv8.exe /f

echo очищаем папку буфер от ненужных cf файлов
del /F /Q %BackupWorkHranPath%
del /F /Q %BackupTestHranPath%

echo Выгружаем конфигурации хранилища и тестовой базы
%ProgramPath% CONFIG /s%WorkHranPath% /n%Login%  /p"" /ConfigurationRepositoryF %ConfigurationRepositoryPath% /ConfigurationRepositoryN %LoginRep% /ConfigurationRepositoryP "1" /ConfigurationRepositoryDumpCfg%BackupWorkHranPath%
%ProgramPath% CONFIG /f%TestHranPath% /n%Login%  /p"" /DumpCfg%BackupTestHranPath%

echo загружаем конфигурацию в тестовую базу и обновляем базу данных
%ProgramPath% CONFIG /s%TestHranPath% /n%Login%  /p"" /LoadCfg%BackupWorkHranPath% /UpdateDBCfg

echo Запускаем тестовую базу и хранилище
set sec=4
set /A sec+=1
Start "" /MIN %ProgramPath% DESIGNER /f%TestHranPath% /n%Login%  /p""
