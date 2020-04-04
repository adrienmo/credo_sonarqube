# CredoSonarqube

Generate a generic issue report to be used in [sonarqube](https://docs.sonarqube.org/latest/analysis/generic-issue/)

```
mix credo --sonarqube-base-folder base/folder/ --sonarqube-file credo_sonarqube.json
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `credo_sonarqube` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:credo_sonarqube, "~> 0.1.0"}
  ]
end
```
