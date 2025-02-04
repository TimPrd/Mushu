defmodule Mushu.Repo.Migrations.FilesAddCreatorColumn do
  use Ecto.Migration

  def change do
    alter table(:files) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
    end
  end

end
