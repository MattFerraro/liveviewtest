defmodule LiveviewtestWeb.GithubDeployView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        <div>
          <button phx-click="github_deploy">Deploy to GitHub</button>
        </div>
        Status: <%= @deploy_step %>
      </div>
    </div>
    """
  end

  # def render(assigns) do
  #   LiveviewtestWeb.PageView.render("github_deploy.html", assigns)
  # end

  def mount(_session, socket) do
    {:ok, assign(socket, deploy_step: "Ready!")}
  end

  def handle_event("github_deploy", _value, socket) do
    send(self(), :create_org)
    {:noreply, assign(socket, deploy_step: "Starting deploy...")}
  end

  def handle_info(:create_org, socket) do
    :timer.sleep(1000)
    send(self(), {:create_repo, "some_org"})
    {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
  end

  def handle_info({:create_repo, _org}, socket) do
    :timer.sleep(1000)
    send(self(), {:push_contents, "some_repo"})
    {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
  end

  def handle_info({:push_contents, _repo}, socket) do
    :timer.sleep(1000)
    send(self(), :done)
    {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
  end

  def handle_info(:done, socket) do
    :timer.sleep(1000)
    {:noreply, assign(socket, deploy_step: "Done!")}
  end


end
