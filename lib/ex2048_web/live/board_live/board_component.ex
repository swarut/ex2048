defmodule Ex2048Web.BoardLive.BoardComponent do
  use Ex2048Web, :live_component
  alias Ex2048.Game

  def render(assigns) do
    ~L"""
    <div id="board" phx-window-keyup="update_board">
      <%= for cell <- @cells do %>
        <div class="item item-16">
          <div class="cell">
            <%= cell %> <%= @key %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  def handle_event("update_board", %{"code" => key_code}, socket) do
    IO.puts("========== #{key_code} was pressed")
    Game.handle_key_event(key_code)
    {:noreply, socket |> assign(:key, "pressed")}
  end
end
