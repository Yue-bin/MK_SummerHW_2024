-- OpMySQL.lua
-- 此文件是对mysql的操作封装

-- 环境初始化
dofile("config.lua")
local mysql_driver = require("luasql.mysql")
local env = mysql_driver.mysql()
local monconn = env:connect(Config_1.mysql.sourcename, Config_1.mysql.username, Config_1.mysql.password,
    Config_1.mysql.hostname, Config_1.mysql.port)

-- 创建一个数据表
-- 接受一个表，按照表的内容在数据库中创建一个数据表
-- 这个表的结构大致如下：
-- {
--     table_name = "book",
--     columns = {
--         {
--             name = "id",
--             type = "INT",
--             auto_increment = true
--         },
--         {
--             name = "bookname",
--             type = "VARCHAR(100)",
--             not_null = true,
--             unique = true
--         },
--         {
--             name = "author",
--             type = "VARCHAR(50)",
--             not_null = true
--         },
--     },
--     primary_key = "id"
-- }
-- 参考:https://mariadb.com/kb/en/create-table/
--暂时只支持部分特性
function CreateTable(table_def)
    -- 根据table_def构造sql语句
    local sql = "CREATE TABLE " .. table_def.table_name .. " ("
    for i, v in ipairs(table_def.columns) do
        sql = sql .. v.name .. " " .. v.type
        if v.auto_increment then
            sql = sql .. " AUTO_INCREMENT"
        end
        if v.not_null then
            sql = sql .. " NOT NULL"
        end
        if v.unique then
            sql = sql .. " UNIQUE"
        end
        if i < #table_def.columns then
            sql = sql .. ", "
        end
    end
    sql = sql .. ", PRIMARY KEY (" .. table_def.primary_key .. "))"
    print(sql)
    -- 执行sql语句
    local cur = monconn:execute(sql)
    print(cur)
    -- 处理返回
    HandleCur(cur)
end

-- 处理cur对象
-- 传入一个cur对象，处理这个对象
function HandleCur(cur)
    if type(cur) == "number" then
        print("受影响的行数:" .. cur)
    else
        local row = cur:fetch({}, "a")
        while row do
            for k, v in pairs(row) do
                print(k .. ":" .. v)
            end
            row = cur:fetch(row, "a")
        end
    end
end

-- 关闭连接
function CloseConn()
    monconn:close()
    env:close()
end
