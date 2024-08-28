dofile("OpMySQL.lua")

-- 测试用例
local book_table_def = {
    table_name = "book",
    columns = {
        {
            name = "id",
            type = "INT",
            auto_increment = true
        },
        {
            name = "bookname",
            type = "VARCHAR(100)",
            not_null = true,
            unique = true
        },
        {
            name = "author",
            type = "VARCHAR(50)",
            not_null = true
        },
    },
    primary_key = "id"
}

CreateTable(book_table_def)
