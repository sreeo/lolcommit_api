defmodule LolcommitServerWeb.CommitController do
  use LolcommitServerWeb, :controller

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

  def uploadCommit(conn,%{"file" => image_params, "message" => id}) do
    IO.inspect image_params
    ImageUploader.store(image_params)
    IO.inspect id
    json conn,[id]
  end
end
