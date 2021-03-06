defmodule Bep.SettingsControllerTest do
  use Bep.ConnCase
  alias Bep.OtherType

  setup %{conn: conn} = config do
    if config[:login_as] do
      user = insert_user()
      Repo.insert!(%OtherType{user_id: user.id, type: ""})
      conn =
        conn
        |> assign(:current_user, user)
        |> assign_message()
      {:ok, conn: conn, user: user}
    else
      :ok
    end
  end

  @tag login_as: %{email: "email@example.com"}
  test "GET /settings", %{conn: conn} do
    insert_types()
    conn = get conn, "/settings"
    assert html_response(conn, 200) =~ "Settings"
  end
end
