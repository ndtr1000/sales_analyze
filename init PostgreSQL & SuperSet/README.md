В данной папке содержатся два файла необходимых для работы с SuperSet и PostgreSQL.
Процесс работы:
1) поднимаем контейнер для локального сервера SuperSet
2) поднимаем контейнер для локального сервера PostgreSQL, связываем контейнер SuperSet и контейнер PostgreSQL единой сетью
3) подключаемся к SuperSet через localhost и можем работать с BD и SuperSet


---

Описание файла `start_first.sh` и его команд:

`start_first` - скрипт файл для первого запуска докер, инициализации PostgreSQL, инициализации SuperSet, создание volume для PostgreSQL. Предпологается, что Docker уже скачан и установлен.

`git clone https://github.com/apache/superset.git` - копирование SuperSet с репозитория Git;

`docker volume create post_1` - создание volume для PostgreSQL. Т.к. при запуске контейнера будем его удалять, чтобы не хранить его, то сохранять прогресс работы с БД будем в специальное хранилище;

`cd superset` - переходим в папку с SuperSet;

`docker-compose -f docker-compose-non-dev.yml pull` - используем docker compose для первичной инициализации SuperSet;


---

Описание файла `start_post_superset.sh` и его команд:

`start_post_superset` - скрипт используется для запуска PostgreSQL и SuperSet;

`docker run --rm -d --name post_1 
  -e POSTGRES_PASSWORD=post_admin 
  -e POSTGRES_USER=post_admin 
  -e POSTGRES_DB=analyze_work 
  --net=superset_default 
  -v postsql:/var/lib/postgresql/data postgres:14` - запускаем контейнер Docker, при выключении этого контейнера он будет удаляться, указываем имя контейнеру, прописываем параметры для БД, подключаем БД к локальной сети SuperSet, указываем где будет хранится volume;
  
`cd superset` - переходим в папку с SuperSet;

`docker-compose -f docker-compose-non-dev.yml up` - используя docker-compose запускаем контейнер с SuperSet;
