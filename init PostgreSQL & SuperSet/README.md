В данной папке содержатся три файла необходимых для работы с SuperSet и PostgreSQL и Jupyter NoteBook
Процесс работы:
1) поднимаем контейнер для локального сервера SuperSet
2) поднимаем контейнер для локального сервера PostgreSQL, связываем контейнер SuperSet и контейнер PostgreSQL единой сетью
3) подключаемся к SuperSet через localhost и можем работать с BD и SuperSet

---
Скрипты написаны для Apple с процессорами архитектуры ARM. Используемая версия OS - Monterey 12.2.1
---

Описание файла `init_containers.sh` и его команд:

`init_containers` - скрипт файл для первого запуска докер, инициализации PostgreSQL, инициализации SuperSet, создание volume для PostgreSQL, инициализация Jupyter NoteBook. Предпологается, что Docker уже скачан и установлен.

`git clone https://github.com/apache/superset.git` - копирование SuperSet с репозитория Git;

`docker volume create post_1` - создание volume для PostgreSQL. Т.к. при запуске контейнера будем его удалять, чтобы не хранить его, то сохранять прогресс работы с БД будем в специальное хранилище;

`cd superset` - переходим в папку с SuperSet;

`docker-compose -f docker-compose-non-dev.yml pull` - используем docker compose для первичной инициализации SuperSet;

docker pull jupyter/scipy-notebook:2023-02-28 - добавляем в Docker Jupyter NootBook
---

Описание файла `start_superset.sh` и его команд:

`start_superset` - скрипт используется для запуска SuperSet;

  
`cd superset` - переходим в папку с SuperSet;

`docker-compose -f docker-compose-non-dev.yml up` - используя docker-compose запускаем контейнер с SuperSet;

---

Описание файла `start_postgresql.sh` и его команд:

`start_postgresql` - скрипт для запуска PostgreSQL;

`docker run --rm -d --name post_1 
  -e POSTGRES_PASSWORD=post_admin 
  -e POSTGRES_USER=post_admin 
  -e POSTGRES_DB=analyze_work 
  --net=superset_default 
  -v postsql:/var/lib/postgresql/data postgres:14` - запускаем контейнер Docker, при выключении этого контейнера он будет удаляться, указываем имя контейнеру, прописываем параметры для БД, подключаем БД к локальной сети SuperSet, указываем где будет хранится volume;
  
---

Описание файла `start_jupyter.sh` и его команд:

`start_jupyter` - скрипт для запуска Jupyter NoteBook;

`docker run --rm -p 8888:8888 --net=superset_default -v ~/notebooks:/home/jovyan jupyter/scipy-notebook:2023-02-28` - запускаем контейнер Docker, при выключении контейнер будет очищаться, прописываем порты где будет запущен Jupyter, указываем сеть для работы между контейнерами и указываем путь куда будут сохраняться файлы Jupyter.
