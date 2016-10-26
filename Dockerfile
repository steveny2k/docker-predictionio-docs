FROM ubuntu
MAINTAINER Steven Yan

ENV GH_ID steveny2k

RUN apt-get update
RUN apt-get install -y git gnupg curl

RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:${GH_ID}/incubator-predictionio.git

RUN apt-get -y -q install rubygems
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN /usr/local/rvm/scripts/rvm requirements
RUN /usr/local/rvm/scripts/rvm install ruby ruby-dev

RUN apt-get install build-essential -y
RUN gem install hitimes
RUN gem install bundler
RUN cd /incubator-predictionio/docs/manual \
    && bundle install \
    && npm install -g bower \
    && bower install

