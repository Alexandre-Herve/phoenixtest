defmodule App.Pets.Cat do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Pets.Cat


  schema "pets_cats" do
    field :destroyed_couch_count, :integer
    field :name, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(%Cat{} = cat, attrs) do
    cat
    |> cast(attrs, [:name, :surname, :destroyed_couch_count])
    |> validate_required([:name, :surname, :destroyed_couch_count])
  end
end
