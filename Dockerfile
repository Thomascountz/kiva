FROM ruby:3.3.0

RUN adduser --shell /bin/bash --uid 1001 app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

USER root
RUN bundle install
RUN chown -R app:app /app

USER app

CMD ["ruby", "bot.rb"]
