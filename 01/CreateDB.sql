-- 创建一个名为MonDB的数据库并创建一个新用户作为其所有者
CREATE DATABASE MonDB;
CREATE USER 'monuser'@'localhost' IDENTIFIED BY 'moncak_password';
GRANT ALL PRIVILEGES ON MonDB.* TO 'monuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;