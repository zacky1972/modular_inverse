defmodule ModularInverse.MixProject do
  use Mix.Project

  def project do
    [
      app: :modular_inverse,
      version: "1.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Modular inverse",
      description: 
        "A fast and efficient Elixir library for calculating modular multiplicative inverses.",
      docs: docs(),
      package: package(),
      aliases: aliases(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE.md", "CHANGELOG.md"]
    ]
  end

  def package do
    [
      name: :modular_inverse,
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/zacky1972/modular_inverse"}
    ]
  end

  def aliases do
    [
      check: [
        "hex.audit",
        "compile --warnings-as-errors --force",
        "format --check-formatted --migrate",
        "credo",
        "deps.unlock --check-unused",
        "spellweaver.check",
        "dialyzer"
      ]
    ]
  end

  def dialyzer do
    [
      plt_add_apps: [:mix],
      ignore_warnings: ".dialyzer_ignore.exs"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:binary_extended_gcd, "~> 1.0"},
      {:nstandard, "~> 0.1"},
      {:ex_doc, "~> 0.31", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:spellweaver, "~> 0.1", only: [:dev, :test], runtime: false}
    ]
  end
end
