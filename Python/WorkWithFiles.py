from datetime import datetime
import os
import time

#__file__ - похоже какая-то переменная окружения, которая хранит путь к текущему файлу питона

def DeleteFilesInFolder(abspath, curent_date):
    max_size = 50
    count_del = 0

    dirfiles = os.listdir(abspath)

    for file in dirfiles:
        file_path = os.path.join(abspath, file)
        if os.path.isdir(file_path):continue
        file_time = os.path.getatime(file_path)
        file_time = datetime.fromtimestamp(file_time)
        file_size = os.path.getsize(file_path)
        if file_time < curent_date or file_size > max_size:
            os.remove(file_path)
            count_del = count_del + 1

    print("deleted files: " + str(count_del))

# очищаем тестовую папку
dirname = os.path.dirname(__file__)

abspath = os.path.abspath(dirname)
abspath = os.path.join(abspath, "test") 

curent_date = datetime(2022, 2, 27, 22, 15, 58)

DeleteFilesInFolder(abspath, curent_date)

