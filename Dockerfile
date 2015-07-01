## -*- docker-image-name: "armbuild/scw-app-zerobin:latest" -*-
FROM armbuild/scw-app-lemp:latest
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Download ZeroBin
RUN rm -rf /var/www \
 && mkdir -p /var/www/tmp /var/www/data \
 && wget -qO - https://github.com/sebsauvage/ZeroBin/archive/master.tar.gz | tar --strip=1 -C /var/www -xzf - \
 && chmod 777 /var/www/tmp /var/www/data

