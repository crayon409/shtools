# redis-stack-server
REDISNAME=redis-stack-server

redisrun: redisclean
	@docker run -itd \
	--name $(REDISNAME) \
	-p 6000:6379 redis/redis-stack-server:latest
.PHONY: redisrun

redisclean:
	@docker rm -f $(REDISNAME)
.PHONY: redisclean
