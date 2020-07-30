defmodule Mushu.ValuablesTest do
  use Mushu.DataCase

  alias Mushu.Valuables

  describe "files" do
    alias Mushu.Valuables.File

    @valid_attrs %{creation_date: ~D[2010-04-17], id: 42, name: "some name", path: "some path", tags: []}
    @update_attrs %{creation_date: ~D[2011-05-18], id: 43, name: "some updated name", path: "some updated path", tags: []}
    @invalid_attrs %{creation_date: nil, id: nil, name: nil, path: nil, tags: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Valuables.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Valuables.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Valuables.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Valuables.create_file(@valid_attrs)
      assert file.creation_date == ~D[2010-04-17]
      assert file.id == 42
      assert file.name == "some name"
      assert file.path == "some path"
      assert file.tags == []
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Valuables.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = Valuables.update_file(file, @update_attrs)
      assert file.creation_date == ~D[2011-05-18]
      assert file.id == 43
      assert file.name == "some updated name"
      assert file.path == "some updated path"
      assert file.tags == []
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Valuables.update_file(file, @invalid_attrs)
      assert file == Valuables.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Valuables.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Valuables.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Valuables.change_file(file)
    end
  end
end
