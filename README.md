#  Note

1. [Cài đặt PHP 8.x](#cài-đặt-php-8x)
2. [Cài đặt Composer 2.x](#cài-đặt-composer-2x)
3. [Cài đặt Laravel & Database](#cài-đặt-laravel--database)
4. [Start dự án](#start-dự-án)

----
## Cài đặt PHP 8.x


Kiểm tra PHP version, nếu màn hình hiện 8.x thì skip qua bước này

```
php -v
```

#### MacOS

```
brew install php@8.0
echo 'export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"' >> ~/.zshrc
zsh
```

Kiểm tra lại version, nếu màn hình hiện PHP 8.x như bên dưới là OK
```
php -v
```
```

PHP 8.0.16 (cli) (built: Feb 18 2022 09:11:08) ( NTS ) Copyright (c) The PHP Group Zend Engine v4.0.16, Copyright (c) Zend Technologies with Zend OPcache v8.0.16, Copyright (c), by Zend Technologies
```

#### Windows
Tải XAMPP support PHP 8.x: https://www.apachefriends.org/download.html


-----

## Cài đặt Composer 2.x

Kiểm tra Composer version, nếu màn hình hiện 2.x thì skip qua bước này

```
composer -v
```

#### MacOS


```
brew install composer
```


Kiểm tra lại version, nếu màn hình hiện Composer 2.x như bên dưới là OK
```
composer -v
```
```
   ______
  / ____/___  ____ ___  ____  ____  ________  _____
 / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/
/ /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /
\____/\____/_/ /_/ /_/ .___/\____/____/\___/_/
                    /_/
Composer version 2.1.6 2021-08-19 17:11:08
```

#### Windows
Tải file & cài đặt: https://getcomposer.org/Composer-Setup.exe


----
## Cài đặt Laravel & Database

```
composer install && yarn && php artisan storage:link && cp .env.example .env && php artisan key:generate && code .env
```
Đổi tên Database tại `DB_DATABASE`

#### MacOS
```
mysql -u root -p
```
Nhập password MySQL, thường là **root**
```
create database `shop-online`;
```
#### Windows
Mở `XAMPP` vào `phpMyAdmin` để cài đặt


----
## Start dự án

#### Chạy khi Pull Code mới về
```
yarn reset
```

#### Frontend Developer
```
php artisan serve
```
```
yarn dev
```


#### Backend Developer
```
php artisan serve
```
```
yarn dev
```
```
yarn backend
```

#### URL

- UI: http://localhost:8000/
- Admin: http://localhost:8000/admin


### Postgre

```
CREATE DATABASE "shop-online" WITH OWNER = root ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;

CREATE USER root WITH PASSWORD 'root';

GRANT ALL PRIVILEGES ON DATABASE "shop-online" TO root;
```
-------

Redis and PHP Redis Extension for XAMPP on Windows
==================================================

Step 1: Download Redis
----------------------

1.  Download Redis for Windows from [GitHub](https://github.com/tporadowski/redis/releases).
2.  Extract the files to a directory (e.g., `C:\Redis`).

Step 2: Install Redis Server
----------------------------

1.  Open a command prompt as admin.
2.  Navigate to Redis directory (e.g., `cd C:\Redis`).
3.  Run `redis-server --service-install` to install Redis as a service.

Step 3: Start Redis Server
--------------------------

Run `redis-server --service-start` to start Redis service.

Step 4: Download PHP Redis Extension
------------------------------------

Download `php_redis.dll` from [PECL](https://pecl.php.net/package/redis) or [GitHub](https://github.com/phpredis/phpredis/releases) matching your PHP version and thread safety (TS or NTS).

Step 5: Configure PHP
---------------------

1.  Find `php.ini` path by opening XAMPP Control Panel > Click Config > PHP.ini.
2.  Copy `php_redis.dll` to XAMPP's PHP extensions directory (e.g., `C:\xampp\php\ext`).
3.  Open `php.ini` and add `extension=php_redis.dll`.
4.  Save and close `php.ini`.

Step 6: Restart XAMPP
---------------------

Restart Apache server in XAMPP Control Panel to load the new configuration.

Step 7: Configure Laravel
-------------------------

1.  Open `.env` file in your Laravel project.
2.  Set `CACHE_DRIVER=redis`.
