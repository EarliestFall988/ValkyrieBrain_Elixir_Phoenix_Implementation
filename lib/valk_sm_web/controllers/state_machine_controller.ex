defmodule ValkSmWeb.StateMachineController do
  use ValkSmWeb, :controller

  def ping(conn, _params) do

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")

  end

  def auth(conn, %{"id" => id} ) do

      IO.puts(id);

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, "{\"status\": \"ok\"}")
  end

end
