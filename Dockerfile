FROM ruby:alpine3.4
MAINTAINER Jan Losinski

RUN \
	apk update && \
	apk add \
		imagemagick \
		libcurl \
		openssl \
		postgresql-libs


RUN	apk add  --virtual .feedbin-builddeps \
		autoconf \
		bison \
		bzip2 \
		bzip2-dev \
		ca-certificates \
		coreutils \
		curl-dev \
		g++ \
		gcc \
		gdbm-dev \
		git \
		glib-dev \
		imagemagick-dev \
		libc-dev \
		libffi-dev \
		libidn-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		ncurses-dev \
		openssl-dev \
		postgresql-dev \
		procps \
		procps \
		readline-dev \
		tar \
		xz \
		yaml-dev \
		zlib-dev \
		&& \
	mkdir /opt && \
	cd /opt && \
	git clone https://github.com/feedbin/feedbin.git && \
	cd /opt/feedbin && \
	bundle && \
	apk del .feedbin-builddeps

ADD config/database.yml /opt/feedbin/config/database.yml
ADD config/environments/production.rb /opt/feedbin/config/environments/production.rb
ADD startup.sh /feedbin-start

CMD ["/bin/bash", "/feedbin-start"]

EXPOSE 9292
