defmodule CredoSonarqube.Formatter.Sonarqube do
    @moduledoc false
  
    alias Credo.Issue
  
    def print_issues(_issues, _base_folder, nil), do: :ok
  
    def print_issues(issues, base_folder, export_file_name) do
      map = %{"issues" => Enum.map(issues, &to_json(&1, base_folder))}
      output = Jason.encode!(map, pretty: true)
      File.write!(export_file_name, output)
    end
  
    defp to_json(
           %Issue{
             check: check,
             category: category,
             message: message,
             filename: filename,
             priority: priority
           } = issue,
           base_folder
         ) do
      check_name =
        check
        |> to_string()
        |> String.replace(~r/^(Elixir\.)/, "")
  
      _column_end =
        if issue.column && issue.trigger do
          _ = issue.column + String.length(to_string(issue.trigger))
        end
  
      %{
        "engineId" => "credo",
        "ruleId" => check_name,
        "severity" => get_severity(priority),
        "type" => get_type(category),
        "effortMinutes" => 90,
        "primaryLocation" => %{
          "message" => message,
          "filePath" => base_folder <> to_string(filename),
          "textRange" => %{
            "startLine" => issue.line_no
          }
        }
      }
    end
  
    def get_type(_category), do: "CODE_SMELL"
  
    def get_severity(priority) do
      cond do
        priority in 20..999 -> "CRITICAL"
        priority in 10..19 -> "MAJOR"
        priority in 0..9 -> "MINOR"
        priority in -10..-1 -> "INFO"
        priority in -999..-11 -> "INFO"
        true -> "INFO"
      end
    end
  end