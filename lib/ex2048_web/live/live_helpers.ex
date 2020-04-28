defmodule Ex2048Web.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `Ex2048Web.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, Ex2048Web.BoardLive.FormComponent,
        id: @board.id || :new,
        action: @live_action,
        board: @board,
        return_to: Routes.board_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, Ex2048Web.ModalComponent, modal_opts)
  end
end
