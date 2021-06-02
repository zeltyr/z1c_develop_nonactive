echo off
Set ProgramPath="C:\Program Files (x86)\1cv8\8.3.17.1549\bin\1cv8.exe"
Set WorkHranServer="test2c\KIS_Hran"
Set ConfigurationRepositoryPath="\\dc-01.geba.ru\shares\NET\common\IT\ОПиБТ\Vault1С"

Set Login="Вдовенко С."
Set LoginRep="Сергей"

set sec=4
set /A sec+=1

ping 127.1 -n %sec% >NUL
start "" /MAX "C:\Program Files\Mozilla Firefox\firefox.exe"

ping 127.1 -n %sec% >NUL
Start "" "C:\Program Files\KeePass Password Safe 2\KeePass.exe"

ping 127.1 -n %sec% >NUL
Start "" "C:\Program Files (x86)\Spark\Spark.exe"

ping 127.1 -n %sec% >NUL
Start "" "C:\Program Files (x86)\GitExtensions\GitExtensions.exe"

ping 127.1 -n %sec% >NUL
%ProgramPath% CONFIG /S%WorkHranServer% /n%Login%  /p"" /ConfigurationRepositoryF %ConfigurationRepositoryPath% /ConfigurationRepositoryN %LoginRep% /ConfigurationRepositoryP "1" /ConfigurationRepositoryUpdateCfg /UpdateDBCfg