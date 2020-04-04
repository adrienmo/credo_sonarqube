defmodule CredoSonarqube do

  import Credo.Plugin
  alias Credo.CLI.Command.Suggest.SuggestCommand
  alias Credo.Execution

  def init(exec) do
    exec
    |> register_cli_switch(:sonarqube_file, :string, :f, fn sonarqube_file ->
      {:sonarqube_file, sonarqube_file}
    end)
    |> register_cli_switch(:sonarqube_base_folder, :string, :b, fn sonarqube_base_folder ->
      {:sonarqube_base_folder, sonarqube_base_folder}
    end)
    |> Execution.append_task(nil, SuggestCommand, :print_after_analysis, {CredoSonarqube.GenerateSonarqubeIssues, []})
  end
end