FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

# Set nginx to run in the foreground
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Download and set up 2048 game
RUN curl -L -o /var/www/html/master.zip https://codeload.github.com/gabrielecirulli/2048/zip/master && \
    cd /var/www/html && \
    unzip master.zip && \
    mv 2048-master/* . && \
    rm -rf 2048-master master.zip

EXPOSE 80

# Start nginx in the foreground
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


# Run echo "deamon off:" >>/etc/nginx/nginx.com
# Run curl -o /var/www/html/master.zip-L https://codeload.github.com/gabrielecirulli/2048/zip/master
# RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

# EXPOSE 80
# CMD ["*/usr/sbin/nginx", "-C","/etc/nginx/nginx.config"]