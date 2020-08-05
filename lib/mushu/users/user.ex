defmodule Mushu.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    has_many :files, Mushu.Valuables.File 
    timestamps()
  end
end
