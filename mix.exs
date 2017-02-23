defmodule Sqlite.Ecto.Mixfile do
  use Mix.Project

  def project do
    [app: :sqlite_ecto2,
     version: "2.0.0-dev.1",
     name: "Sqlite.Ecto2",
     elixir: "~> 1.3",
     elixirc_options: [warnings_as_errors: true],
     deps: deps(),
     elixirc_paths: elixirc_paths(Mix.env),
     package: package(),
     test_paths: test_paths()]
  end

  def application do
    [applications: [:db_connection, :ecto, :logger]]
  end

  defp deps do
    [{:backoff, git: "https://github.com/scouten/backoff.git", ref: "8f10cb83b5fbc2401e6a06b341417cad4c632f34", override: true},
     {:db_connection, git: "https://github.com/elixir-ecto/db_connection", ref: "625e42521e2b72f597c388daa6ecf5a90d7bd6e7", override: true}, # version 0.1.7
     {:esqlite, git: "https://github.com/mmzeeman/esqlite", ref: "785903ae6d157ebda824e4e841f1f63aa93f9208", override: true},
     {:ecto, git: "https://github.com/scouten/ecto.git", ref: "b738eb1967bac6c0ab1f56925a1ed19a6fb5413f"},
     {:poison, "~> 1.0"},
     {:postgrex, git: "https://github.com/ericmj/postgrex.git", ref: "f773f8d4b88565aea435c6651b711ebfce74c9c2", override: true},
     {:sbroker, "~> 1.0", override: true},
     {:sqlitex, git: "https://github.com/scouten/sqlitex.git", ref: "8f1dcd4107cd99ca0687bf870b914e44a467722d", override: true}]
  end

  defp package do
    [maintainers: ["Jason M Barnes", "Eric Scouten"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/scouten/sqlite_ecto2"}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/sqlite_db_connection/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp test_paths, do: ["integration/sqlite", "test"]
end
