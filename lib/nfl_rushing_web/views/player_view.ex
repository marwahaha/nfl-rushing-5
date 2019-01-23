defmodule NflRushingWeb.PlayerView do
  use NflRushingWeb, :view
  alias NflRushing.Player.Statistics
  alias NflRushingWeb.PlayerView

  def render("index.json", %{players: players}) do
    %{data: render_many(players, PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{
      "Att": player.att,
      "Att/G": player.att_per_game,
      "1st": player.first,
      "1st%": player.first_percentage,
      "40+": player.fourty_plus,
      "FUM": player.fum,
      "Player": player.name,
      "Pos": player.pos,
      "Team": player.team,
      "TD": player.touchdowns,
      "20+": player.twenty_plus,
      "Avg": player.yards_per_att,
      "Yds/G": player.yards_per_game,
      "Yds": player.yards,
      "Lng": generate_longest_rush(player)
    }
  end

  defp generate_longest_rush(%{long: long, long_td: true}), do: "#{long}T"
  defp generate_longest_rush(%{long: long}), do: "#{long}"
end
