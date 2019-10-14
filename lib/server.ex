defmodule Empresas.Server do
  use GenServer

  alias Empresas.Empresa
  ###
  # External API
  #
  
  def start() do
    value =
      [
        %Empresa{ id: 1, name: "Empresa 1 increible", address: "no recuerdo",
                 zip: 28034, city: "Madrid", country: "Spain"},
        %Empresa{ id: 2, name: "Empresa 2 increible", address: "no recuerdo",
                 zip: 28034, city: "Madrid", country: "Spain"}
      ]
    GenServer.start(__MODULE__, value, name: __MODULE__)
  end

  def all() do
    GenServer.call(__MODULE__, :all)
  end

  def put(value) do
    GenServer.cast(__MODULE__, {:put, value})
  end

  ###
  # GenServer implementation

  def init(value) do
    {:ok, value}
  end

  def handle_call(:all, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:put, empresa}, state) do
    state = [empresa | state]
    {:noreply,  state }
  end

end
