defmodule Empresas.Server do
  use GenServer

  ###
  # External API
  #
  
  def start(value\\[]) do
    GenServer.start(__MODULE__, value)
  end

  def all(pid) do
    GenServer.call(pid, :all)
  end

  def put(pid, value) do
    GenServer.cast(pid, {:put, value})
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
