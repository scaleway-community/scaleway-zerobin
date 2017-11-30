## -*- docker-image-name: "scaleway/privatebin:latest" -*-
ARG ARCH
FROM scaleway/ubuntu:${ARCH}-xenial


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


RUN apt-get install -qy nginx php-fpm php-gd

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
