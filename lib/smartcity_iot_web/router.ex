defmodule SmartcityIotWeb.Router do
  use SmartcityIotWeb, :router

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

  scope "/", SmartcityIotWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", SmartcityIotWeb do
    pipe_through :api

    resources "/logs", LogController, except: [:new, :edit, :delete]
  end



  # Other scopes may use custom stacks.
  # scope "/api", SmartcityIotWeb do
  #   pipe_through :api
  # end
end
