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
end
