defmodule ProjectFitAcademyWeb.PageController do
  use ProjectFitAcademyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
