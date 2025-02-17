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
composer install && cp .env.example .env && php artisan key:generate && code .env
```
Đổi tên Database tại `DB_DATABASE`

#### MacOS
```
mysql -u root -p
```
Nhập password MySQL, thường là **root**
```
create database `test`;
```
#### Windows
Mở `XAMPP` vào `phpMyAdmin` để cài đặt


----
## Start dự án
```
php artisan serve
```

----
## Cài đặt database
```
php artisan migrate:fresh --seed
```
Hoặc import file sql từ path: 'database/data/test.sql'


#### Tài khoản đăng nhập
- tk, mk là email, vd: tk: 'User 1@example.com', mk: 'User 1@example.com'

#### URL
- Đăng nhập: http://localhost:8000/login
- Danh sách sản phẩm: http://localhost:8000/
- Lấy toàn bộ con cháu user đang đang nhập: http://localhost:8000/users/children
- Lấy toàn bộ con cháu user theo id: http://localhost:8000/users/children?id=2
- Lấy danh sách thu nhập của từng user: http://localhost:8000/users/revenues

