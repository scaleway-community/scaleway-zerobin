## -*- docker-image-name: "scaleway/zerobin:latest" -*-
FROM scaleway/lemp:latest
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Download ZeroBin
RUN rm -rf /var/www \
 && mkdir -p /var/www/tmp /var/www/data \
 && wget -qO - https://github.com/sebsauvage/ZeroBin/archive/master.tar.gz | tar --strip=1 -C /var/www -xzf - \
 && chmod 777 /var/www/tmp /var/www/data

ADD ./patches/etc/ /etc/

# Configure NginX
RUN ln -sf /etc/nginx/sites-available/zerobin /etc/nginx/sites-enabled/zerobin && \
    rm -f /etc/nginx/sites-enabled/my_website
