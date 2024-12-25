defmodule PhoenixFlowbiteSampleWeb.FlowbiteComponents do
  use Phoenix.Component
  use Gettext, backend: PhoenixFlowbiteSampleWeb.Gettext

  attr :id, :string, required: true
  attr :type, :atom, default: :info, values: [:info, :success, :warning, :danger, :dark]
  slot :inner_block, required: true

  def alert(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "flex items-center p-4 mb-4 text-sm rounded-lg dark:bg-gray-800",
        case @type do
          :info -> "text-blue-800 bg-blue-50 dark:text-blue-400"
          :success -> "text-green-800 bg-green-50 dark:text-green-400"
          :warning -> "text-yellow-800 bg-yellow-50 dark:text-yellow-400"
          :danger -> "text-red-800 bg-red-50 dark:text-red-400"
          :dark -> "text-gray-800 bg-gray-50 dark:text-gray-400"
        end
      ]}
      role="alert"
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  def info_icon(assigns) do
    ~H"""
    <svg
      class="flex-shrink-0 inline w-4 h-4 me-3"
      aria-hidden="true"
      xmlns="http://www.w3.org/2000/svg"
      fill="currentColor"
      viewBox="0 0 20 20"
    >
      <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
    </svg>
    """
  end
end
