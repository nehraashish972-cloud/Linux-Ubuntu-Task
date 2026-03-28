FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY html/index.html /var/opt/nginx/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
