REPO=snmatt/sndev
NAME=solarnetwork-mqtt
VER=2
PORT=1883

build : 
	docker build -t $(NAME)-$(VER) .
	
buildstage : 
	docker build --target build -t $(NAME)-$(VER) .
	
rebuild : 
	docker build --no-cache -t $(NAME)-$(VER) .
	
start : 
	docker start $(NAME)-$(VER)

stop : 
	docker stop $(NAME)-$(VER)

remove : 
	docker rm $(NAME)-$(VER)

push:
	docker push $(NAME)-$(VER):latest snmatt/sndev:$(NAME)-$(VER)

run :
	docker run -d \
		--publish $(PORT):1883 \
		--memory 512MB \
		--name $(NAME)-$(VER) \
		$(NAME)-$(VER):latest
		
shell:
	docker exec -it $(NAME)-$(VER) /bin/bash

