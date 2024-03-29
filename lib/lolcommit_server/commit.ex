

defmodule LolcommitServer.Commit do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:file, :message, :repo, :author_email, :author_name]}
  schema "commits" do
    field :author_email, :string
    field :author_name, :string
    field :file, :string
    field :message, :string
    field :repo, :string
    field :url, :string

    timestamps()
  end

  @doc false

  def changeset(commit, attrs) do
    commit
    |> cast(attrs, [:message, :file, :author_name, :author_email, :repo, :url])
  end
end
