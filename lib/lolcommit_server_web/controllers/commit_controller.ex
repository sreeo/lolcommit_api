
defmodule LolcommitServerWeb.CommitController do

  use LolcommitServerWeb, :controller
  alias LolcommitServer.Commit
  alias LolcommitServer.Repo

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

  def getCommits(conn,_params) do
    res = Repo.all(Commit)
    json conn,res
  end

  def uploadCommit(conn,%{"file" => file,"sha" => sha, "message" => message, "repo" => repo, "author_email" => author_email,"author_name" => author_name}) do
    # IO.inspect image_params

    fileName =  sha <> ".gif"
    IO.inspect fileName
    # changeset = Commit.changeset(%Commit{}, %{file: :fileName,sha: :sha,message: :message,repo: :repo,author_email: :author_email, author_name: :author_name})
    Repo.insert(%Commit{file: fileName, message: message,repo: repo,author_email: author_email, author_name: author_name})
    fileResponse = ImageUploader.store(file)
    fileUrl = ImageUploader.url(file)
    IO.inspect fileUrl
    json conn,[fileName]
  end
end
