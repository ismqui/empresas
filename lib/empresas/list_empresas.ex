defmodule Empresas.ListEmpresas do
  @moduledoc """
  The list of data about the companies
  """

  def all do
    Empresas.Server.all()
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
