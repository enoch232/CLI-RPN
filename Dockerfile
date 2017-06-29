FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /CLI-RPN
WORKDIR /CLI-RPN
ADD Gemfile /CLI-RPN/Gemfile
ADD Gemfile.lock /CLI-RPN/Gemfile.lock
RUN bundle install
ADD . /CLI-RPN
