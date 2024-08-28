# 算是笔记（？

首先安装 `MariaDB`，之所以采用 `MariaDB`作为使用的数据库主要是因为之前折腾博客的时候用过一点）

跟着[Download MariaDB Server - MariaDB.org](https://mariadb.org/download/?t=repo-config&d=Debian+12+%22Bookworm%22&v=11.4&r_m=neusoft)上的指引完成 `MariaDB`在我的Debian宿舍服务器上的安装

然后使用 `CreateDB.sql`创建数据库 `MonDB`并对其进行操作

用 `luarocks`安装 `luasql-mysql`模块的时候出了点小问题，大概是缺头文件什么的

随手装了两个包 `libmariadbd-dev` ，`default-libmysqlclient-dev`解决

开发时参照文档[LuaSQL: Database connectivity for the Lua programming language (lunarmodules.github.io)](https://lunarmodules.github.io/luasql/manual.html)和[Documentation - MariaDB.org](https://mariadb.org/documentation/)

`luasql`库的调用结构大致如下（可能不叫调用结构我也不知道叫什么）

- driver 也就是require得到的对象
  - environment 由driver产生的对象
    - connection 由environment调用连接方法产生的连接对象
      - cursor 由connection调用execute方法产生的光标对象

~层次好分明好喜欢~

我敲mariadb他甚至有中文知识库[MariaDB Knowledge Base](https://mariadb.com/kb/zh-cn/)

好吧还是建议啃英文因为中文少很多东西）
