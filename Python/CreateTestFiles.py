import os
import time

dirname = os.path.dirname(__file__)
abspath = os.path.abspath(dirname)

#генерируем тестовые файлы
abspath = os.path.join(abspath, "test")
if os.path.exists(abspath) == False:
    os.mkdir(abspath)

i = 999
while i < 1010: 
    i = i + 1
    perem_str = 'text' + str(i) + ".txt"
    file_path = os.path.join(abspath, perem_str)
    time.sleep(1)
    my_file = open(file_path, "w+")
    my_file.close()