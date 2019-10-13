defmodule Empresas.ListEmpresas do
  @moduledoc """
  The list of data about the companies
  """

  alias Empresas.Empresa

  def all do
    [
      %Empresa{ id: 1, name: "Tamoe innovation", address: "no recuerdo", zip: 28034, city: "Madrid", country: "Spain"},
      %Empresa{ id: 2, name: "Keylates", address: "no recuerdo", zip: 28034, city: "Madrid", country: "Spain"}
    ]
  end

  def get(id) do
    Enum.find(all(), fn map -> map.id == id end)
  end

  def get_by(params) do
    Enum.find(all(), fn map ->
      Enum.all?(params, fn {key, val} ->
        Map.get(map, key) == val end)
    end)
  end
end
