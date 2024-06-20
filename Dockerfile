#FROM tomcat:9.0
#COPY target/convert_coins.war /usr/local/tomcat/webapps/


# Dockerfile
FROM tomcat:9.0

# Copie suas aplicações e configurações, se necessário
# COPY ./your-app.war /usr/local/tomcat/webapps/
COPY target/convert_coins.war /usr/local/tomcat/webapps/

# Exponha a porta do debugger (default 8000)
EXPOSE 8080 8000

# Comando de inicialização do Tomcat com opções de depuração
CMD ["catalina.sh", "jpda", "run"]
