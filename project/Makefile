all :
	@mkdir -p /home/amahdiou/data/mariadb/ /home/amahdiou/data/wordpress/
	@docker-compose -f srcs/docker-compose.yml up -d --build

clean :
	@docker-compose -f srcs/docker-compose.yml down
	@sudo rm -rf /home/amahdiou/data/mariadb/ /home/amahdiou/data/wordpress/


fclean : clean
	@docker system prune -af
	@sudo rm -rf /home/amahdiou/data/mariadb/ /home/amahdiou/data/wordpress/

re : clean all