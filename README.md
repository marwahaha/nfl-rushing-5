# NflRushing

To install Elixir, Phoenix, and Yarn using Brew follow the steps below:
  * Update Brew `brew update`
  * Install elixir `brew install elixir`
  * Install elixir package manager `mix local.hex`
  * Install Phoenix `mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez`
  * Install Yarn `brew install yarn`

Next, We need Postgresql Installed
  * Install the Postgres application from [`postgresapp`](https://postgresapp.com/downloads.html)
  * Open Postrgres application, initialize and start postgres if not already running
  

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create, Migrate, and Seed your database with `mix ecto.setup`
  * Install dependencies with `cd assets && yarn install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
