defmodule ProjectFitAcademyWeb.UploadController do
    use ProjectFitAcademyWeb, :controller
    alias ProjectFitAcademy.Documents
    alias ProjectFitAcademy.Users

   
    def create(conn, %{"upload" => %Plug.Upload{}=upload, "user_id" => user_id}) do
        IO.inspect Documents.get_upload!(user_id)
        case Documents.create_upload_from_plug_upload(upload, user_id) do
            {:ok, upload}->
              put_flash(conn, :info, "file uploaded correctly")
              redirect(conn, to: Routes.user_path(conn, :show,  Users.get_user!(user_id), Documents.get_upload!(user_id)))
        
            {:error, reason}->
              put_flash(conn, :error, "error upload file: #{inspect(reason)}")
              redirect(conn, to: Routes.user_path(conn, :show,  Users.get_user!(user_id), Documents.get_upload!(user_id)))
          end
    end
end