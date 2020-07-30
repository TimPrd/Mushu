defmodule Mushu.Valuables.File do
  use Ecto.Schema
  import Ecto.Changeset

  schema "files" do
    field :creation_date, :date
    field :uid, :integer
    field :name, :string
    field :path, :string
    field :tags, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:name, :path, :creation_date, :uid, :tags])
    |> validate_required([:name, :path, :creation_date, :uid, :tags])
    |> unique_constraint(:uid)
  end
end
