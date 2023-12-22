# migrate with mysql
migrate -database "mysql://root:admin@tcp(127.0.0.1:31000)/tests" -path migrations/ down 1
