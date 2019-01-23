defmodule NflRushing.Player.Statistics do
  use Ecto.Schema
  import Ecto.Changeset


  schema "player_statistics" do
    field :att, :integer
    field :att_per_game, :float
    field :first, :integer
    field :first_percentage, :float
    field :fourty_plus, :integer
    field :fum, :integer
    field :long, :integer
    field :long_td, :boolean, default: false
    field :name, :string
    field :pos, :string
    field :team, :string
    field :touchdowns, :integer
    field :twenty_plus, :integer
    field :yards, :integer
    field :yards_per_att, :float
    field :yards_per_game, :float

    timestamps()
  end

  @doc false
  def changeset(statistics, attrs) do
    statistics
    |> cast(attrs, [:name, :team, :pos, :att, :att_per_game, :yards, :yards_per_att, :yards_per_game, :touchdowns, :long, :long_td, :first, :first_percentage, :twenty_plus, :fourty_plus, :fum])
    |> validate_required([:name, :team, :pos, :att, :att_per_game, :yards, :yards_per_att, :yards_per_game, :touchdowns, :long, :long_td, :first, :first_percentage, :twenty_plus, :fourty_plus, :fum])
  end

  def map_json(%{"Lng" => longest_rush} = obj) when Kernel.is_bitstring(longest_rush) do
    map_common_json(obj)
    |> Map.put("long", parse_long(longest_rush))
    |> Map.put("long_td", long_td?(longest_rush))
  end
  
  def map_json(obj) do
    map_common_json(obj)
    |> Map.put("long", obj["Lng"])
    |> Map.put("long_td", "false")
  end

  # Private Methods

  defp map_common_json(%{"Yds" => yards} = obj) do
    %{
      "att" => obj["Att"],
      "att_per_game" => obj["Att/G"],
      "first" => obj["1st"],
      "first_percentage" => obj["1st%"],
      "fourty_plus" => obj["40+"],
      "fum" => obj["FUM"],
      "name" => obj["Player"],
      "pos" => obj["Pos"],
      "team" => obj["Team"],
      "touchdowns" => obj["TD"],
      "twenty_plus" => obj["20+"],
      "yards_per_att" => obj["Avg"],
      "yards_per_game" => obj["Yds/G"],
    }
    |> Map.put("yards", clean_yards(yards))
  end

  # Get rid of commas to create records
  defp clean_yards(yards) when is_bitstring(yards) == false, do: yards
  defp clean_yards(yards) do
    with true <- String.contains?(yards, ",") do
      String.replace(yards, ",", "")
    else
      _->
        yards
    end
  end


  defp parse_long(longest_rush) do
    longest_rush
    |> String.split("T")
    |> List.first()
  end

  defp long_td?(rush) do
    with true <- String.contains?(rush, "T") do
      "true"
    else
      _ -> 
        "false"
    end
  end
end
