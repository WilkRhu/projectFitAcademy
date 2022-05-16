defmodule ProjectFitAcademy.Documents do
    import Ecto.Query, warn: false
    
    alias ProjectFitAcademy.Repo
    alias ProjectFitAcademy.Documents.Upload

    def create_upload_from_plug_upload(
        %Plug.Upload{
        filename: filename,
        path: tmp_path,
        content_type: content_type,
        }, user_id
      ) do
        hash = 
            File.stream!(tmp_path, [], 2048) 
            |> Upload.sha256()

            with {:ok, %File.Stat{size: size}} <- File.stat(tmp_path),  
            {:ok, upload} <- 
                %Upload{} 
                |> Upload.changeset(%{
                filename: filename, content_type: content_type,
                hash: hash, size: size, user_id: user_id }) 
                |> Repo.insert(),
            :ok <- File.cp(
                tmp_path,
                Upload.local_path(user_id, filename)
            )

            do
            
            {:ok, upload}

            else

            {:error, reason}=error -> error

            end
      end
      
      def get_upload!(user_id), do: Repo.get!(Documents, user_id)

    end
