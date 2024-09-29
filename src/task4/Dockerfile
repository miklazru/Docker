FROM nginx

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev

COPY server.c /etc/nginx/
COPY nginx.conf /etc/nginx/

RUN gcc -o /etc/nginx/server /etc/nginx/server.c -lfcgi

CMD ["sh", "-c", "spawn-fcgi -p 8080 /etc/nginx/server && nginx -g 'daemon off;'"]