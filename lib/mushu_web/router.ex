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
    plug MushuWeb.ApiAuthPlug, otp_app: :mushu
  end

  pipeline :api_protected do
      plug Pow.Plug.RequireAuthenticated, error_handler: MushuWeb.ApiAuthErrorHandler
  end

  scope "/", MushuWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/api", MushuWeb do
    pipe_through :api
    # get "/", FileController, :index
  end


  scope "/api", MushuWeb do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api", MushuWeb do
    pipe_through :api
  end

  scope "/api", MushuWeb do
    pipe_through [:api, :api_protected]
    resources "/files", FileController, except: [:new, :edit]
  end


  # Other scopes may use custom stacks.
  # scope "/api", MushuWeb do
  #   pipe_through :api
  # end
end
