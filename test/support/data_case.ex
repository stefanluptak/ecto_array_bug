defmodule DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import DataCase
    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    :ok
  end
end
