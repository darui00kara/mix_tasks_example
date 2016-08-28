defmodule Mix.Tasks.Sample do
  use Mix.Task
  import Mix.Generator

  @shortdoc "My custom task sample"

  @moduledoc """
  """

  def run(_args) do
    app_module = Mix.Project.config[:app] |> Atom.to_string |> Mix.Utils.camelize
    assigns = [app_module: app_module]

    # template
    create_file(
      Path.join(["lib", "test_template.ex"]) |> Path.relative_to(Mix.Project.app_path),
      test_template(assigns))

    # text
    create_file(
      Path.join(["lib", "test.ex"]) |> Path.relative_to(Mix.Project.app_path),
      test_text)
  end

  # template
  embed_template :test, """
  defmodule <%= @app_module %>.TestTemplate do
  end
  """

  # text
  embed_text :test, """
  defmodule MyMixCmd.Test do
  end
  """
end