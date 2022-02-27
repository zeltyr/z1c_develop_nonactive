from datetime import datetime
import os
import time

# __file__ - похоже какая-то переменная окружения, которая хранит путь к текущему файлу питона


def DeleteFilesInFolder(abspath, curent_date):
    max_size = 50
    ex_files = ["DMT_Set_DocumentDebtEx",
                "DMT_Set_BalanceDocumentEx", "DMT_User3_Get_TT_TPE", "text1010"]
    count_del = 0

    dirfiles = os.listdir(abspath)

    for file in dirfiles:

        file_path = os.path.join(abspath, file)
        if os.path.isdir(file_path):
            continue

        full_name = os.path.basename(file_path)
        file_name = os.path.splitext(full_name)[0]
        if file_name in ex_files:
            os.remove(file_path)
            count_del = count_del + 1
            continue
        
        file_time = os.path.getatime(file_path)
        file_time = datetime.fromtimestamp(file_time)

        file_size = os.path.getsize(file_path)

        if file_time < curent_date or file_size > max_size:
            os.remove(file_path)
            count_del = count_del + 1

    print("deleted files: " + str(count_del))


dirname = os.path.dirname(__file__)  # берём полный путь текущего файла

abspath = os.path.abspath(dirname)  # вычленяем путь к папке
abspath = os.path.join(abspath, "test")  # переходим в папку "test"

if os.path.exists(abspath):

    # дата раньше которой надо удалить файлы
    curent_date = datetime(2022, 2, 27, 22, 15, 59)
    DeleteFilesInFolder(abspath, curent_date)
