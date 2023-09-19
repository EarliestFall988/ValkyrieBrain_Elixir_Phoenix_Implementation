defmodule ValkSm.StateMachineV1Test do
  use ValkSmWeb.ConnCase

  def getJSONFile(part) do
    case part do
      "variables" ->
        [
          %{"name" => "var1", "type" => "int", "value" => 0},
          %{"name" => "var2", "type" => "int", "value" => 0},
          %{"name" => "var3", "type" => "int", "value" => 0}
        ]

      "functions" ->
        [
          %{"name" => "func1", "parameters" => ["var1", "var2"]},
          %{"name" => "func2", "parameters" => ["var1", "var2"]},
          %{"name" => "func3", "parameters" => ["var1", "var2"]}
        ]

      "states" ->
        [
          %{"name" => "state1", "function" => "func1"},
          %{"name" => "state2", "function" => "func2"},
          %{"name" => "state3", "function" => "func3"}
        ]

      "transitions" ->
        [
          %{"from" => "state1", "to" => "state2", "outcome" => "0"},
          %{"from" => "state2", "to" => "state3", "condition" => "1"},
          %{"from" => "state3", "to" => "state1", "condition" => "-1"}
        ]
    end
  end

  def createStructure() do
    variables = getJSONFile("variables")
    functions = getJSONFile("functions")
    states = getJSONFile("states")
    transitions = getJSONFile("transitions")

    result = %ValkSm.StateMachineV1{
      :variables => variables,
      :functions => functions,
      :states => states,
      :transitions => transitions
    }

    result
  end

  # test "handle transitions" do
  #   structure = createStructure()

  #   IO.inspect(structure)

  #   ValkSm.StateMachineV1.handleTransitions(:ok, :start, structure)

  #   assert true

  # end
end
