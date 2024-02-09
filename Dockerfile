FROM ruby:3.3.0

RUN adduser --shell /bin/bash --uid 1001 app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY bot.rb Rakefile ./
COPY lib ./lib
COPY start.sh ./

RUN chown -R app:app /app
RUN chmod +x start.sh

USER app

CMD ["./start.sh"]
