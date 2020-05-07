defmodule SmartcityIot.RequestsTest do
  use SmartcityIot.DataCase

  alias SmartcityIot.Requests

  describe "logs" do
    alias SmartcityIot.Requests.Log

    @valid_attrs %{app_id: "some app_id", counter: 42, dev_id: "some dev_id", download_url: "some download_url", hardware_serial: "some hardware_serial", metadata: %{}, payload_fields: %{}, payload_raw: "some payload_raw", port: 42}
    @update_attrs %{app_id: "some updated app_id", counter: 43, dev_id: "some updated dev_id", download_url: "some updated download_url", hardware_serial: "some updated hardware_serial", metadata: %{}, payload_fields: %{}, payload_raw: "some updated payload_raw", port: 43}
    @invalid_attrs %{app_id: nil, counter: nil, dev_id: nil, download_url: nil, hardware_serial: nil, metadata: nil, payload_fields: nil, payload_raw: nil, port: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Requests.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Requests.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Requests.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Requests.create_log(@valid_attrs)
      assert log.app_id == "some app_id"
      assert log.counter == 42
      assert log.dev_id == "some dev_id"
      assert log.download_url == "some download_url"
      assert log.hardware_serial == "some hardware_serial"
      assert log.metadata == %{}
      assert log.payload_fields == %{}
      assert log.payload_raw == "some payload_raw"
      assert log.port == 42
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, %Log{} = log} = Requests.update_log(log, @update_attrs)
      assert log.app_id == "some updated app_id"
      assert log.counter == 43
      assert log.dev_id == "some updated dev_id"
      assert log.download_url == "some updated download_url"
      assert log.hardware_serial == "some updated hardware_serial"
      assert log.metadata == %{}
      assert log.payload_fields == %{}
      assert log.payload_raw == "some updated payload_raw"
      assert log.port == 43
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Requests.update_log(log, @invalid_attrs)
      assert log == Requests.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Requests.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Requests.change_log(log)
    end
  end
end
