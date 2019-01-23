defmodule NflRushingWeb.PlayerController do
  use NflRushingWeb, :controller
  alias NflRushing.{
    Repo,
    Player.Statistics  
  }

  def index(conn, _params) do
    players =
      Statistics
      |> Repo.all()

    render(conn, "index.json", players: players)
  end
end
