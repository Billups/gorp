#!/bin/sh

# on macs, you may need to:
# export GOBUILDFLAG=-ldflags -linkmode=external

set -e

export GORP_TEST_DSN=gorptest/gorptest/gorptest
export GORP_TEST_DIALECT=mysql
go test $GOBUILDFLAG -coverprofile=coverage-mysql.out .

export GORP_TEST_DSN=gorptest:gorptest@/gorptest
export GORP_TEST_DIALECT=gomysql
go test $GOBUILDFLAG -coverprofile=coverage-gomysql.out .

# export GORP_TEST_DSN="user=gorptest password=gorptest dbname=gorptest sslmode=disable"
# export GORP_TEST_DIALECT=postgres
# go test $GOBUILDFLAG .

# export GORP_TEST_DSN=/tmp/gorptest.bin
# export GORP_TEST_DIALECT=sqlite
# go test $GOBUILDFLAG -coverprofile=coverage-sqlite.out .

go tool cover -html=coverage-mysql.out
go tool cover -html=coverage-gomysql.out
