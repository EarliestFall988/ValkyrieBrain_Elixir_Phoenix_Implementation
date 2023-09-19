defmodule ValkSmWeb.StateMachineController do
  import ValkSm.StateMachineV1
  use ValkSmWeb, :controller

  def ping(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end

  def auth(conn, %{"id" => id}) do
    IO.puts(id)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end

  def build(conn, params) do
    # IO.inspect(params["sm"])

    variables = params["sm"]["variables"]
    functions = params["sm"]["functions"]
    states = params["sm"]["states"]
    transitions = params["sm"]["transitions"]

    # IO.inspect(%{"vars" =>  variables})
    # IO.inspect(%{"funcs" => functions})
    # IO.inspect(%{"states" => states})
    # IO.inspect(%{"transitions" => transitions})
    # result = constructStateMachine(params)

    result =
      constructStateMachine(%{
        "variables" => variables,
        "functions" => functions,
        "states" => states,
        "transitions" => transitions
      })

    IO.inspect(result)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, "{\"status\": \"ok\"}")
  end
end
