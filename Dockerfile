FROM busybox:latest

# Criar um usuário não-root e diretório para os arquivos estáticos
RUN adduser -D -u 1000 www-data && mkdir -p /www && chown www-data:www-data /www

WORKDIR /www

# Criar um arquivo index.html com o conteúdo "12345"
RUN echo "12345" > /www/index.html && chown www-data:www-data /www/index.html

# Expor a porta 8080
EXPOSE 8080

# Executar como usuário não-root
USER www-data

# Iniciar o servidor HTTP do BusyBox
CMD ["httpd", "-f", "-v", "-p", "8080"]
