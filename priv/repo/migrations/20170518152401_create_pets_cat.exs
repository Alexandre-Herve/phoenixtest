defmodule App.Repo.Migrations.CreateApp.Pets.Cat do
  use Ecto.Migration

  def change do
    create table(:pets_cats) do
      add :name, :string
      add :surname, :string
      add :destroyed_couch_count, :integer

      timestamps()
    end

  end
end
