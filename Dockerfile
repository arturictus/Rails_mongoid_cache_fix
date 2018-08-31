FROM ruby:2.5.1-stretch
CMD ["bundle", "exec", "rake", "test"]
COPY . /home/app
WORKDIR /home/app
RUN bundle install
