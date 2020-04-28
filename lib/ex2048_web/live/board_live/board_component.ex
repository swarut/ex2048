defmodule Ex2048Web.BoardLive.BoardComponent do
  use Ex2048Web, :live_component

  def render(assigns) do
    ~L"""
    <div id="board">
      <%= for cell <- @cells do %>
        <div class="item item-<%= cell %>">
          <div class="cell">
            <%= cell %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
