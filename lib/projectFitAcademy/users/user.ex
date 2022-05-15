defmodule ProjectFitAcademy.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :police, Ecto.Enum, values: [:Admin, :Supervisor, :Teacher, :Studants]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :police])
    |> validate_required([:name, :email, :password, :police])
    |> unique_constraint(:email)
  end
end
