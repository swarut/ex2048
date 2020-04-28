defmodule Ex2048Web.BoardLive.BoardComponent do
  use Ex2048Web, :live_component

  def render(assigns) do
    ~L"""
    <div id="board" phx-window-keyup="update_board" phx-target="<%= @myself %>">
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

  def handle_event("update_board", %{"code" => key_code}, socket) do
    IO.puts("========== #{key_code} was pressed")
    {:noreply, socket |> assign(:key, "pressed")}
  end
end
