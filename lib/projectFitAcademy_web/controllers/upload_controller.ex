defmodule ProjectFitAcademyWeb.UploadController do
    use ProjectFitAcademyWeb, :controller


    def new(conn, _params) do
        render(conn, "newUpload.html")
    end

    def create(conn, %{"upload" => %Plug.Upload{}=upload}) do
        IO.inspect(upload, label: "UPLOAD")
        text conn, "file enviado com sucesso"
    end
end