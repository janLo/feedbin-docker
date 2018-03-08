FROM ruby:2.3-slim-stretch
MAINTAINER Jan Losinski
ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends\
		ca-certificates \
		curl \
		git-core \
		imagemagick \
		libbz2-1.0 \
		libidn11 \
		libxml2 \
		libxslt1.1 \
		openssl \
		libyaml-0-2 \
		postgresql-client \
		tzdata \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD ARG CLONE_ARGS

ONBUILD RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		build-essential \
		g++ \
		gcc \
		libcurl4-openssl-dev \
		libffi-dev \
		libgdbm-dev \
		libidn11-dev \
		libmagic-dev \
		libmagickwand-dev \
		libpq-dev \
		libreadline-dev \
		libssl-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		libz-dev \
		ncurses-dev \
		&& \
	gem install psych && \
	cd /opt && \
	echo $CLONE_ARGS && \
	git clone $CLONE_ARGS app && \
	cd app && bundle && \
	apt-get -y remove --purge \
		build-essential \
		g++ \
		gcc \
		libcurl4-openssl-dev \
		libffi-dev \
		libgdbm-dev \
		libidn11-dev \
		libmagic-dev \
		libmagickwand-dev \
		libpq-dev \
		libpq-dev \
		libreadline-dev \
		libssl-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		libz-dev \
		ncurses-dev \
		&& \
	apt-get --purge -y autoremove && apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ONBUILD ADD startup.sh /feedbin-start
ONBUILD RUN chmod +x /feedbin-start

CMD ["/feedbin-start"]
