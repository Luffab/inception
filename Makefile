up: 
	docker-compose -f ./srcs/docker-compose.yaml up

down:
	docker-compose -f ./srcs/docker-compose.yaml down

.PHONY: up down