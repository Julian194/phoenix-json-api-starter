defmodule MyApp.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:is_active, :boolean, default: false)
    field(:email, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :is_active])
    |> validate_required([:email, :is_active])
    |> unique_constraint(:email)
  end
end
