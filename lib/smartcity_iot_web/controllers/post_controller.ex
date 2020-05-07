defmodule SmartcityIotWeb.PostController do
  use SmartcityIotWeb, :controller

  alias SmartcityIot.Request
  alias SmartcityIot.Request.Post

  action_fallback SmartcityIotWeb.FallbackController

  def index(conn, _params) do
    posts = Request.list_posts()
    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{
    "payload_fields" => payload_fields
  }) do

    with {:ok, %Post{} = post} <- Request.create_post(payload_fields) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Request.get_post!(id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Request.get_post!(id)

    with {:ok, %Post{} = post} <- Request.update_post(post, post_params) do
      render(conn, "show.json", post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Request.get_post!(id)

    with {:ok, %Post{}} <- Request.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end
end
