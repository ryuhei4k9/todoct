FROM ruby:2.7.0

# install common libs
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    locales \
    mariadb-client \
    autoconf libpng-dev libtool make nasm pkg-config \
    vim

# clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# setup locale to ja_JP
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen ja_JP.UTF-8 \
    && /usr/sbin/update-locale LANG=ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# setup rails
ENV APP_ROOT_DIR /app
RUN mkdir $APP_ROOT_DIR
WORKDIR $APP_ROOT_DIR

# bundle install
COPY Gemfile Gemfile.lock ./
RUN gem install bundler \
    && bundle install

# set shell config files
COPY . $APP_ROOT_DIR
COPY dockerfiles/files/etc/profile.d/common.sh /etc/profile.d/common.sh
