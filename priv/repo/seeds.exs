# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NflRushing.Repo.insert!(%NflRushing.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#SEED FROM JSON FILE

alias NflRushing.Player.Statistics
alias NflRushing.Repo

Path.expand('./assets/json/rushing.json')
|> File.read!
|> Poison.Parser.parse!
|> Enum.each(fn obj ->
  %Statistics{}
  |> Statistics.changeset(Statistics.map_json(obj))
  |> Repo.insert!
end)
