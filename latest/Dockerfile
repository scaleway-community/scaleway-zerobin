## -*- docker-image-name: "scaleway/privatebin:latest" -*-
ARG SCW_ARCH
FROM scaleway/ubuntu:${SCW_ARCH}-xenial


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


RUN apt-get update && apt-get -y upgrade && apt-get install -y nginx php-fpm php-gd

RUN mkdir -p /srv/www/privatebin/ \
    && mkdir -p /srv/www/privatebin/data/ \
    && chown www-data:www-data /srv/www/privatebin/data/ \
    && REPO_URL='https://api.github.com/repos/PrivateBin/PrivateBin/releases/latest' \
    && TARBALL_URL=$( wget -qO- ${REPO_URL}  | sed -n 's/"tarball_url"\:[[:blank:]]*"\(.*\)",/\1/p' ) \
    && wget -qO- ${TARBALL_URL} | gunzip - | tar --strip=1 -C /srv/www/privatebin/ -x -f -

# Configure Nginx
ADD ./patches/etc/ /etc/
RUN ln -sf /etc/nginx/sites-available/privatebin /etc/nginx/sites-enabled/privatebin \
    && rm -f /etc/nginx/sites-enabled/default
