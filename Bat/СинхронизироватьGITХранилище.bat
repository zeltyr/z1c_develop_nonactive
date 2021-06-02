@echo off
set LocalGit="D:\0Git\KIS_Hran"
set GitHran="\\dc-01.geba.ru\shares\NET\common\IT\ОПиБТ\Vault1С"
set Login="sync"
set Password="sync"

set version1c="8.3.17"

cd /d %LocalGit%

rem делаем push в Git
git -C %LocalGit% push origin 

rem gitsync --v8version %version1c%  sync -u%Login% -p%Password% %GitHran% %LocalGit%rem 
gitsync --v8-path "C:\Program Files (x86)\1cv8\8.3.17.1549\bin\1cv8.exe" sync -u%Login% -p%Password% %GitHran% %LocalGit%