FROM ruby:alpine
MAINTAINER Saisrihitha Yadlapali <saisrihithay@gmail.com>
RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver
ENTRYPOINT [ "rspec" ]
