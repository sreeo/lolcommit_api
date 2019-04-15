

defmodule LolcommitServer.Commit do
  use Ecto.Schema
  import Ecto.Changeset
  schema "commits" do
    field :author_email, :string
    field :author_name, :string
    field :file, :string
    field :message, :string
    field :repo, :string

    timestamps()
  end

  @doc false

  def changeset(commit, attrs) do
    commit
    |> cast(attrs, [:message, :file, :author_name, :author_email, :repo])
  end
end
