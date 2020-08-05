defmodule MushuWeb.FileController do
  use MushuWeb, :controller

  alias Mushu.Valuables
  alias Mushu.Valuables.File

  action_fallback MushuWeb.FallbackController

  def index(conn, _params) do
    user_id = conn.assigns.current_user.id
    files = Valuables.list_files(user_id)
    render(conn, "index.json", files: files)
  end

  def create(conn, %{"file" => file_params}) do
    user_id = conn.assigns.current_user.id
    with {:ok, %File{} = file} <- Valuables.create_file(file_params, user_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.file_path(conn, :show, file))
      |> render("show.json", file: file)
    end
  end

  def show(conn, %{"id" => id}) do
    file = Valuables.get_file!(id)
    render(conn, "show.json", file: file)
  end

  def update(conn, %{"id" => id, "file" => file_params}) do
    file = Valuables.get_file!(id)

    with {:ok, %File{} = file} <- Valuables.update_file(file, file_params) do
      render(conn, "show.json", file: file)
    end
  end

  def delete(conn, %{"id" => id}) do
    file = Valuables.get_file!(id)

    with {:ok, %File{}} <- Valuables.delete_file(file) do
      send_resp(conn, :no_content, "")
    end
  end
end
