ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Thefirehoseproject.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Thefirehoseproject.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Thefirehoseproject.Repo)

