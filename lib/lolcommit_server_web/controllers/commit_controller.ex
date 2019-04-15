defmodule LolcommitServerWeb.CommitController do
  use LolcommitServerWeb, :controller
  alias Commit
  alias Repo

  def index(conn,_params) do
    commits = [ %{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"},
      %{name: "Anne",
        email: "anne@example.com",
        password: "guessme",
        stooge: "larry"},
      %{name: "Franklin",
        email: "franklin@example.com",
        password: "guessme",
        stooge: "curly"}]
    json conn,commits
  end

  def uploadCommit(conn,%{"file" => file, "message" => message, "repo" => repo, "author_email" => author_email,"author_name" => author_name}) do
    # IO.inspect image_params
    ImageUploader.store(file)
    json conn,[message]
  end
end
 
