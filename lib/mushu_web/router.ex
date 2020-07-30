defmodule MushuWeb.Router do
  use MushuWeb, :router

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

  scope "/", MushuWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", MushuWeb do
    pipe_through :api
    get "/", FileController, :index
    resources "/files", FileController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MushuWeb do
  #   pipe_through :api
  # end
end
