defmodule Bep.SettingsControllerTest do
  use Bep.ConnCase
  setup %{conn: conn} = config do
    if config[:login_as] do
      user = insert_user()
      conn = assign(conn, :current_user, user)
      {:ok, conn: conn, user: user}
    else
      :ok
    end
  end

  @tag login_as: %{email: "email@example.com"}
  test "GET /settings", %{conn: conn} do
    conn = get conn, "/settings"
    assert html_response(conn, 200) =~ "Settings"
  end
end
