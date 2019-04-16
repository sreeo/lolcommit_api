defmodule LolcommitServer.Repo.Migrations.AddUrlInCommits do
  use Ecto.Migration

  def change do
    alter table(:commits) do
      add :url, :string # Database type
    end
  end
end
