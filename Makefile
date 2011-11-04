
include $(GOROOT)/src/Make.inc

TARG=github.com/wwaites/redis
GOFILES=\
	redis.go\

include $(GOROOT)/src/Make.pkg

tools:
	${GC} -o redis-dump.${O} redis-dump.go
	${LD} -o redis-dump redis-dump.${O}
	install -m 0755 redis-dump $(GOBIN)
	${GC} -o redis-load.${O} redis-load.go
	${LD} -o redis-load redis-load.${O}
	install -m 0755 redis-load $(GOBIN)

format:
	gofmt -spaces=true -tabindent=false -tabwidth=4 -w redis.go
	gofmt -spaces=true -tabindent=false -tabwidth=4 -w redis_test.go
	gofmt -spaces=true -tabindent=false -tabwidth=4 -w redis-load.go
	gofmt -spaces=true -tabindent=false -tabwidth=4 -w redis-dump.go

