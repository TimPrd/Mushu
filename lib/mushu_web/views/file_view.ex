defmodule MushuWeb.FileView do
  use MushuWeb, :view
  alias MushuWeb.FileView

  def render("index.json", %{files: files}) do
    %{data: render_many(files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id,
      name: file.name,
      path: file.path,
      uid: file.uid,
      creation_date: file.creation_date,
      tags: file.tags}
  end
end
