defmodule ReactPhoenixTodoListWeb.PageController do
  use ReactPhoenixTodoListWeb, :controller
  alias ReactPhoenixTodoList.Todo

  def home(conn, _params) do
    tasks = Todo.list_tasks()
    render(conn, "home.html", props: Poison.encode!(%{tasks: tasks}))
  end
end
