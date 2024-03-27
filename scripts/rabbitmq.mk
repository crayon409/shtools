# rabbitmq-manage
RABBITNAME=rabbitmq-manage

rbrun: rbclean
	@docker run -itd \
	--name $(RABBITNAME) \
	-p 15672:15672 redis/rabbitmq-manage:latest
.PHONY: rbrun

rbclean:
	@docker rm -f $(RABBITNAME)
.PHONY: rbclean
