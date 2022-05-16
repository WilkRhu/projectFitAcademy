defmodule ProjectFitAcademy.Repo.Migrations.AddIdUserUpload do
  use Ecto.Migration

  def change do
    alter table(:uploads) do 
      add :user_id, references(:users)
    end
    create unique_index(:uploads, [:user_id])
  end
end
