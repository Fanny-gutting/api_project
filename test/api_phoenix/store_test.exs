defmodule ApiPhoenix.StoreTest do
  use ApiPhoenix.DataCase

  alias ApiPhoenix.Store

  describe "users" do
    alias ApiPhoenix.Store.Users

    import ApiPhoenix.StoreFixtures

    @invalid_attrs %{"username": nil, email: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Store.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Store.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{"username": "some  username", email: "some email"}

      assert {:ok, %Users{} = users} = Store.create_users(valid_attrs)
      assert users.username == "some  username"
      assert users.email == "some email"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{"username": "some updated  username", email: "some updated email"}

      assert {:ok, %Users{} = users} = Store.update_users(users, update_attrs)
      assert users.username == "some updated  username"
      assert users.email == "some updated email"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_users(users, @invalid_attrs)
      assert users == Store.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Store.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Store.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Store.change_users(users)
    end
  end

  describe "clocks" do
    alias ApiPhoenix.Store.Clocks

    import ApiPhoenix.StoreFixtures

    @invalid_attrs %{"time": nil, status: nil}

    test "list_clocks/0 returns all clocks" do
      clocks = clocks_fixture()
      assert Store.list_clocks() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Store.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      valid_attrs = %{"time": ~N[2022-10-24 11:23:00], status: true}

      assert {:ok, %Clocks{} = clocks} = Store.create_clocks(valid_attrs)
      assert clocks.time == ~N[2022-10-24 11:23:00]
      assert clocks.status == true
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      update_attrs = %{"time": ~N[2022-10-25 11:23:00], status: false}

      assert {:ok, %Clocks{} = clocks} = Store.update_clocks(clocks, update_attrs)
      assert clocks.time == ~N[2022-10-25 11:23:00]
      assert clocks.status == false
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_clocks(clocks, @invalid_attrs)
      assert clocks == Store.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Store.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Store.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Store.change_clocks(clocks)
    end
  end

  describe "clocks" do
    alias ApiPhoenix.Store.Clocks

    import ApiPhoenix.StoreFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clocks = clocks_fixture()
      assert Store.list_clocks() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Store.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      valid_attrs = %{status: true, time: ~N[2022-10-24 12:05:00]}

      assert {:ok, %Clocks{} = clocks} = Store.create_clocks(valid_attrs)
      assert clocks.status == true
      assert clocks.time == ~N[2022-10-24 12:05:00]
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-25 12:05:00]}

      assert {:ok, %Clocks{} = clocks} = Store.update_clocks(clocks, update_attrs)
      assert clocks.status == false
      assert clocks.time == ~N[2022-10-25 12:05:00]
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_clocks(clocks, @invalid_attrs)
      assert clocks == Store.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Store.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Store.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Store.change_clocks(clocks)
    end
  end

  describe "workingtimes" do
    alias ApiPhoenix.Store.Workingtimes

    import ApiPhoenix.StoreFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtimes = workingtimes_fixture()
      assert Store.list_workingtimes() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Store.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~N[2022-10-25 11:05:00], start: ~N[2022-10-25 11:05:00]}

      assert {:ok, %Workingtimes{} = workingtimes} = Store.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~N[2022-10-25 11:05:00]
      assert workingtimes.start == ~N[2022-10-25 11:05:00]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~N[2022-10-26 11:05:00], start: ~N[2022-10-26 11:05:00]}

      assert {:ok, %Workingtimes{} = workingtimes} = Store.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~N[2022-10-26 11:05:00]
      assert workingtimes.start == ~N[2022-10-26 11:05:00]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Store.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Store.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Store.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Store.change_workingtimes(workingtimes)
    end
  end
end
