defmodule Ex2048Web.BoardLive.BoardComponent do
  use Ex2048Web, :live_component

  def render(assigns) do
    ~L"""
      <div> yo <b><%= assigns[:name] %></b> </div>
    """
  end
end
