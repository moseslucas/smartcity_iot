defmodule SmartcityIotWeb.LogController do
  require IEx
  use SmartcityIotWeb, :controller

  alias SmartcityIot.Requests
  alias SmartcityIot.Requests.Log

  action_fallback SmartcityIotWeb.FallbackController

  def index(conn, _params) do
    logs = Requests.list_logs()
    render(conn, "index.json", logs: logs)
  end

  def create(conn, log_params) do
    with {:ok, %Log{} = log} <- Requests.create_log(log_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.log_path(conn, :show, log))
      |> render("show.json", log: log)
    end
  end

  def show(conn, %{"id" => id}) do
    log = Requests.get_log!(id)
    render(conn, "show.json", log: log)
  end

  def update(conn, %{"id" => id, "log" => log_params}) do
    log = Requests.get_log!(id)

    with {:ok, %Log{} = log} <- Requests.update_log(log, log_params) do
      render(conn, "show.json", log: log)
    end
  end

  def delete(conn, %{"id" => id}) do
    log = Requests.get_log!(id)

    with {:ok, %Log{}} <- Requests.delete_log(log) do
      send_resp(conn, :no_content, "")
    end
  end
end
