defmodule ApiPhoenix.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiPhoenix.Store` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        username: "some  username",
        email: "some email"
      })
      |> ApiPhoenix.Store.create_users()

    users
  end

  @doc """
  Generate a clocks.
  """
  def clocks_fixture(attrs \\ %{}) do
    {:ok, clocks} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-24 12:05:00]
      })
      |> ApiPhoenix.Store.create_clocks()

    clocks
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-25 11:05:00],
        start: ~N[2022-10-25 11:05:00]
      })
      |> ApiPhoenix.Store.create_workingtimes()

    workingtimes
  end
end
