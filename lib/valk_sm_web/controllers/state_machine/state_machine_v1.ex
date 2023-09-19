defmodule ValkSm.StateMachineV1 do
  defstruct [:variables, :functions, :states, :transitions]

  @spec constructStateMachine(map) :: %ValkSm.StateMachineV1{}
  def constructStateMachine(%{
        "variables" => variables,
        "functions" => functions,
        "states" => states,
        "transitions" => transitions
      }) do
    # IO.inspect(functions)

    funcs =
      Enum.map(functions, fn x ->
        atom = String.to_atom(x["name"])
        {atom, x["parameters"]}
      end)

    sm = %ValkSm.StateMachineV1{}

    struct = %ValkSm.StateMachineV1{
      sm
      | variables: variables,
        functions: funcs,
        states: states,
        transitions: transitions
    }

    struct
  end

  # for an error return {:error, funcName, params} this would be a 0 in valkyrie
  # for halt return {:halt, funcName, params} this would be a -1 in valkyrie

  # def handleTransitions(result, funcName, struct) do

  #   # structure = %ValkSm.StateMachineV1{
  #   #   struct
  #   #   | variables: struct[:variables],
  #   #     functions: struct[:functions],
  #   #     states: struct[:states],
  #   #     transitions: struct[:transitions]
  #   # }

  #   IO.inspect(struct)

  #   transitions =
  #    struct[:transitions] |> Enum.filter(fn x -> String.to_atom(x["from"]) == funcName end)

  #   IO.puts(transitions)
  # end

  def runNextFunction(funcName, struct) do
    case funcName do
      :start ->
        # transition here ????
        start(funcName, struct)
    end
  end

  def start(funName, struct) do
    # this is a 1 in valkyrie
    {:ok, funName, struct}
  end
end
