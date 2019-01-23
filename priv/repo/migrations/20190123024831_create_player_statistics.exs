defmodule NflRushing.Repo.Migrations.CreatePlayerStatistics do
  use Ecto.Migration

  def change do
    create table(:player_statistics) do
      add :name, :string
      add :team, :string
      add :pos, :string
      add :att, :integer
      add :att_per_game, :float
      add :yards, :integer
      add :yards_per_att, :float
      add :yards_per_game, :float
      add :touchdowns, :integer
      add :long, :integer
      add :long_td, :boolean, default: false, null: false
      add :first, :integer
      add :first_percentage, :float
      add :twenty_plus, :integer
      add :fourty_plus, :integer
      add :fum, :integer

      timestamps()
    end

  end
end
