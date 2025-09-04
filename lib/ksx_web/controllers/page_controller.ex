defmodule KsxWeb.PageController do
  use KsxWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
