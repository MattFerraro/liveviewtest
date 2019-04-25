defmodule LiveviewtestWeb.PageController do
  use LiveviewtestWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, LiveviewtestWeb.GithubDeployView, session: %{})
  end
end
