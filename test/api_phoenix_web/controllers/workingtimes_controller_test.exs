defmodule ApiPhoenixWeb.WorkingtimesControllerTest do
  use ApiPhoenixWeb.ConnCase

  import ApiPhoenix.StoreFixtures

  alias ApiPhoenix.Store.Workingtimes

  @create_attrs %{
    end: ~N[2022-10-25 11:06:00],
    start: ~N[2022-10-25 11:06:00]
  }
  @update_attrs %{
    end: ~N[2022-10-26 11:06:00],
    start: ~N[2022-10-26 11:06:00]
  }
  @invalid_attrs %{end: nil, start: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all workingtimes", %{conn: conn} do
      conn = get(conn, Routes.workingtimes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create workingtimes" do
    test "renders workingtimes when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workingtimes_path(conn, :create), workingtimes: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.workingtimes_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end" => "2022-10-25T11:06:00",
               "start" => "2022-10-25T11:06:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workingtimes_path(conn, :create), workingtimes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update workingtimes" do
    setup [:create_workingtimes]

    test "renders workingtimes when data is valid", %{conn: conn, workingtimes: %Workingtimes{id: id} = workingtimes} do
      conn = put(conn, Routes.workingtimes_path(conn, :update, workingtimes), workingtimes: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.workingtimes_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "end" => "2022-10-26T11:06:00",
               "start" => "2022-10-26T11:06:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, workingtimes: workingtimes} do
      conn = put(conn, Routes.workingtimes_path(conn, :update, workingtimes), workingtimes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete workingtimes" do
    setup [:create_workingtimes]

    test "deletes chosen workingtimes", %{conn: conn, workingtimes: workingtimes} do
      conn = delete(conn, Routes.workingtimes_path(conn, :delete, workingtimes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.workingtimes_path(conn, :show, workingtimes))
      end
    end
  end

  defp create_workingtimes(_) do
    workingtimes = workingtimes_fixture()
    %{workingtimes: workingtimes}
  end
end
