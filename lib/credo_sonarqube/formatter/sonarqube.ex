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
           priority: _priority
         } = issue,
         base_folder
       ) do
    check_name =
      check
      |> to_string()
      |> String.replace(~r/^(Elixir\.)/, "")

    {type, severity, effort} = Converter.get_details(check)

    column_end =
      if issue.column && issue.trigger do
        _ = issue.column + String.length(to_string(issue.trigger))
      end

    text_range =
      if is_nil(column_end) do
        %{"startLine" => issue.line_no}
      else
        %{
          "startLine" => issue.line_no,
          "startColumn" => issue.column,
          "endColumn" => column_end,
          "endLine" => issue.line_no
        }
      end

    %{
      "engineId" => "credo",
      "ruleId" => check_name,
      "severity" => String.upcase(to_string(severity)),
      "type" => String.upcase(to_string(type)),
      "effortMinutes" => effort,
      "primaryLocation" => %{
        "message" => message,
        "filePath" => base_folder <> to_string(filename),
        "textRange" => text_range
      }
    }
  end
end
