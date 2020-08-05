defmodule MushuWeb.FileControllerTest do
  use MushuWeb.ConnCase

  alias Mushu.Valuables
  alias Mushu.Valuables.File

  @create_attrs %{
    creation_date: ~D[2010-04-17],
    id: 42,
    name: "some name",
    path: "some path",
    tags: []
  }
  @update_attrs %{
    creation_date: ~D[2011-05-18],
    id: 43,
    name: "some updated name",
    path: "some updated path",
    tags: []
  }
  @invalid_attrs %{creation_date: nil, id: nil, name: nil, path: nil, tags: nil}

  def fixture(:file) do
    {:ok, file} = Valuables.create_file(@create_attrs)
    file
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    # test "lists all files", %{conn: conn} do
    #   conn = get(conn, Routes.file_path(conn, :index))
    #   assert json_response(conn, 200)["data"] == []
    # end
  end

  describe "create file" do
  #   test "renders file when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.file_path(conn, :create), file: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.file_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "creation_date" => "2010-04-17",
  #              "name" => "some name",
  #              "path" => "some path",
  #              "tags" => []
  #            } = json_response(conn, 200)["data"]
  #   end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.file_path(conn, :create), file: @invalid_attrs)
      assert json_response(conn, 401)["errors"] != %{}
    end
  end

  describe "update file" do
    setup [:create_file]

    # test "renders file when data is valid", %{conn: conn, file: %File{id: id} = file} do
    #   conn = put(conn, Routes.file_path(conn, :update, file), file: @update_attrs)
    #   assert %{"id" => ^id} = json_response(conn, 200)["data"]

    #   conn = get(conn, Routes.file_path(conn, :show, id))

    #   assert %{
    #            "id" => id,
    #            "creation_date" => "2011-05-18",
    #            "name" => "some updated name",
    #            "path" => "some updated path",
    #            "tags" => []
    #          } = json_response(conn, 200)["data"]
    # end

    # test "renders errors when data is invalid", %{conn: conn, file: file} do
    #   conn = put(conn, Routes.file_path(conn, :update, file), file: @invalid_attrs)
    #   assert json_response(conn, 401)["errors"] != %{}
    # end
  end

  describe "delete file" do
    setup [:create_file]

    # test "deletes chosen file", %{conn: conn, file: file} do
    #   conn = delete(conn, Routes.file_path(conn, :delete, file))
    #   assert response(conn, 204)

    #   assert_error_sent 404, fn ->
    #     get(conn, Routes.file_path(conn, :show, file))
    #   end
    # end
  end

  defp create_file(_) do
    file = fixture(:file)
    {:ok, file: file}
  end
end
