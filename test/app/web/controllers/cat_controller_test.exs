defmodule App.Web.CatControllerTest do
  use App.Web.ConnCase

  alias App.Pets
  alias App.Pets.Cat

  @create_attrs %{destroyed_couch_count: 42, name: "some name", surname: "some surname"}
  @update_attrs %{destroyed_couch_count: 43, name: "some updated name", surname: "some updated surname"}
  @invalid_attrs %{destroyed_couch_count: nil, name: nil, surname: nil}

  def fixture(:cat) do
    {:ok, cat} = Pets.create_cat(@create_attrs)
    cat
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cat_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates cat and renders cat when data is valid", %{conn: conn} do
    conn = post conn, cat_path(conn, :create), cat: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, cat_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "destroyed_couch_count" => 42,
      "name" => "some name",
      "surname" => "some surname"}
  end

  test "does not create cat and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cat_path(conn, :create), cat: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen cat and renders cat when data is valid", %{conn: conn} do
    %Cat{id: id} = cat = fixture(:cat)
    conn = put conn, cat_path(conn, :update, cat), cat: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, cat_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "destroyed_couch_count" => 43,
      "name" => "some updated name",
      "surname" => "some updated surname"}
  end

  test "does not update chosen cat and renders errors when data is invalid", %{conn: conn} do
    cat = fixture(:cat)
    conn = put conn, cat_path(conn, :update, cat), cat: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen cat", %{conn: conn} do
    cat = fixture(:cat)
    conn = delete conn, cat_path(conn, :delete, cat)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, cat_path(conn, :show, cat)
    end
  end
end
