defmodule LolcommitServerWeb.Router do
  use LolcommitServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/api/v1", LolcommitServerWeb do
    pipe_through :api

    post "/commit", CommitController, :uploadCommit
  end
  # Other scopes may use custom stacks.
  # scope "/api", LolcommitServerWeb do
  #   pipe_through :api
  # end
end
