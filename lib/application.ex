defmodule EctoArrayBug.Application do
  use Application

  @impl true
  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: EctoArrayBug.Supervisor]
    Supervisor.start_link([Repo], opts)
  end
end
