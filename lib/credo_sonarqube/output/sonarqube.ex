defmodule CredoSonarqube.Output.Sonarqube do
  @moduledoc false

  alias Credo.Execution
  alias CredoSonarqube.Formatter.Sonarqube

  def print_before_info(_source_files, _exec), do: nil

  def print_after_info(_source_files, exec, _time_load, _time_run) do
    sonarqube_file = Execution.get_plugin_param(exec, CredoSonarqube, :sonarqube_file)

    sonarqube_base_folder =
      Execution.get_plugin_param(exec, CredoSonarqube, :sonarqube_base_folder)

    exec
    |> Execution.get_issues()
    |> Sonarqube.print_issues(sonarqube_base_folder, sonarqube_file)
  end
end
