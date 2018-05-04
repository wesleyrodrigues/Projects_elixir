defmodule Learn.FormController do
  use Learn.Web, :controller
  alias Learn.Thing

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Thing.changeset(%Thing{})
    render(conn, "new.html", changeset: changeset)
  end

  def teste1(conn, _params) do
    changeset = Thing.changeset(%Thing{})
    render(conn, "teste1.html", changeset: changeset)
  end

  def create(conn, %{"thing" => user_params}) do
    changeset = Thing.changeset(%Thing{}, user_params)

    case Repo.insert(changeset) do
      {:ok, thing} ->
        conn
        |> put_flash(:info, "#{thing.name} foi criado")
        |> redirect(to: form_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def teste(conn, params) do
    conn
    |> put_flash(:info, inspect params)
  end
end