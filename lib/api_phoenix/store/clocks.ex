defmodule ApiPhoenix.Store.Clocks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :time, :naive_datetime
    field :status, :boolean, default: false
    field belongs_to :user , ApiPhoenix.Store.Users, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(clocks, attrs) do
    clocks
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status])
  end
end
