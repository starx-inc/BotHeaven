FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yard \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

RUN mkdir /app

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

RUN yard config --gem-install-yri

ADD . /app
WORKDIR /app
