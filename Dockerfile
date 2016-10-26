FROM ruby:2.1
MAINTAINER Steven Yan

ENV GH_ID steveny2k

RUN apt-get update
RUN apt-get install -y git gnupg curl

RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:${GH_ID}/incubator-predictionio.git

RUN gem install bundler
RUN apt-get install apt-utils nodejs npm -y

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN cd /incubator-predictionio/docs/manual \
    && bundle install \
    && npm install -g bower \
    && bower install --allow-root

RUN cd /incubator-predictionio/docs/manual \
    && bundle exec middleman build

