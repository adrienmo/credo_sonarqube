defmodule CredoSonarqube.ConvertCliSwitchesToPluginParams do
    @moduledoc false
  
    use Credo.Execution.Task
  
    def call(exec, _) do
      sonarqube_file = Execution.get_given_cli_switch(exec, :sonarqube_file)
      Execution.put_plugin_param(exec, CredoSonarqube, :sonarqube_file, sonarqube_file)
    end
  end