defmodule ProjectFitAcademy.Repo.Migrations.RemoveFieldAvatarUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :avatar
    end
  end
end
