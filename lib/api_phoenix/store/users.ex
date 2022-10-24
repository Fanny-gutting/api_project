defmodule ApiPhoenix.Store.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :" username", :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:" username", :email])
    |> validate_required([:" username", :email])
  end
end
