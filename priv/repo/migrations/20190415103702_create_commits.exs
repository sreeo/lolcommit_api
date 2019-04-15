defmodule LolcommitServer.Repo.Migrations.CreateCommits do
  use Ecto.Migration

  def change do
    create table(:commits) do
      add :message, :string
      add :file, :string
      add :author_name, :string
      add :author_email, :string
      add :repo, :string

      timestamps()
    end

  end
end
