defmodule CredoSonarqube.Formatter.Sonarqube do
  @moduledoc false

  alias Credo.Issue
  alias CredoSonarqube.Converter

  def print_issues(_issues, _base_folder, nil), do: :ok

  def print_issues(issues, base_folder, export_file_name) do
    map = %{"issues" => Enum.map(issues, &to_json(&1, base_folder))}
    output = Jason.encode!(map, pretty: true)
    File.write!(export_file_name, output)
  end

  defp to_json(
         %Issue{
           check: check,
           category: _category,
           message: message,
           filename: filename,
           priority: _priority,
           line_no: start_line
         },
         base_folder
       ) do
    check_name =
      check
      |> to_string()
      |> String.replace(~r/^(Elixir\.)/, "")

    {type, severity, effort} = Converter.get_details(check)

    %{
      "engineId" => "credo",
      "ruleId" => check_name,
      "severity" => String.upcase(to_string(severity)),
      "type" => String.upcase(to_string(type)),
      "effortMinutes" => effort,
      "primaryLocation" => %{
        "message" => message,
        "filePath" => base_folder <> to_string(filename),
        # Credo do not provide enough information for extended textRange
        "textRange" => %{"startLine" => start_line || 1}
      }
    }
  end
end
