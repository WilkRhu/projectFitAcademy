defmodule ProjectFitAcademy.Documents.Upload do
  use Ecto.Schema
  import Ecto.Changeset

  schema "uploads" do
    field :content_type, :string
    field :filename, :string
    field :hash, :string
    field :size, :integer
    field :user_id, :integer
    belongs_to :users, ProjectFitAcademy.Users

    timestamps()
  end

  @doc false
  def changeset(upload, attrs) do
    upload
    |> cast(attrs, [:filename, :size, :content_type, :hash, :user_id])
    |> validate_required([:filename, :size, :content_type, :hash, :user_id])

    # added validations
    |> validate_number(:size, greater_than: 0) #doesn't allow empty files
    |> validate_length(:hash, is: 64)
  end

  def upload_directory do
    Application.get_env(:projectFitAcademy, :uploads_directory)
  end
  
  def local_path(id, filename) do
    ["priv/static/media", "#{id}-#{filename}"]
    |> Path.join()
  end

  def sha256(chunks_enum) do
    chunks_enum
    |> Enum.reduce(
        :crypto.hash_init(:sha256),
        &(:crypto.hash_update(&2, &1))
    ) 
    |> :crypto.hash_final()
    |> Base.encode16()
    |> String.downcase()
  end
  
end
