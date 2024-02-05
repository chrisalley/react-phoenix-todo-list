defmodule ReactPhoenixTodoList.Repo do
  use Ecto.Repo,
    otp_app: :react_phoenix_todo_list,
    adapter: Ecto.Adapters.Postgres
end
