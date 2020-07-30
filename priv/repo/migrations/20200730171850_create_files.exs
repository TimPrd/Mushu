defmodule Mushu.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :name, :string
      add :path, :string
      add :creation_date, :date
      add :uid, :integer
      add :tags, {:array, :string}

      timestamps()
    end

    create unique_index(:files, [:uid])
  end
end
