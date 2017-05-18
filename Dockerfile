FROM bitwalker/alpine-elixir-phoenix:latest

EXPOSE 4000

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

CMD ["iex", "-S", "mix", "phoenix.server"]
