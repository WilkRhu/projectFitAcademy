defmodule ProjectFitAcademy.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectFitAcademy.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password",
        police: "some police"
      })
      |> ProjectFitAcademy.Users.create_user()

    user
  end
end
