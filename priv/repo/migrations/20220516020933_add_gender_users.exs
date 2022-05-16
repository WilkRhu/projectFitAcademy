defmodule ProjectFitAcademy.Repo.Migrations.AddGenderUsers do
  use Ecto.Migration

    def change do
      alter table(:users) do 
        add :gender, :string
    end
  end
end
