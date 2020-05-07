defmodule SmartcityIotWeb.LogView do
  use SmartcityIotWeb, :view
  alias SmartcityIotWeb.LogView

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id,
      app_id: log.app_id,
      dev_id: log.dev_id,
      hardware_serial: log.hardware_serial,
      port: log.port,
      counter: log.counter,
      payload_raw: log.payload_raw,
      payload_fields: log.payload_fields,
      metadata: log.metadata,
      download_url: log.download_url}
  end
end
