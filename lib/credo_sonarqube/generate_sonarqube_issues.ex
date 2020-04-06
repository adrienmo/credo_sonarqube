defmodule CredoSonarqube.GenerateSonarqubeIssues do
  use Credo.Execution.Task

  alias CredoSonarqube.Output.Sonarqube

  def call(exec, _opts) do
    Sonarqube.print_after_info(nil, exec, nil, nil)
    exec
  end
end
