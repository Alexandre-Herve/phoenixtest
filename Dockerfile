FROM bitwalker/alpine-elixir-phoenix:latest

EXPOSE 4000

RUN apk add --update bash && rm -rf /var/cache/apk/*

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

CMD ["mix", "phoenix.server"]
