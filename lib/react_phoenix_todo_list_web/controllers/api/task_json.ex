defmodule ReactPhoenixTodoListWeb.Api.TaskJSON do
  alias ReactPhoenixTodoList.Todo.Task

  @doc """
  Renders a list of tasks.
  """
  def index(%{tasks: tasks}) do
    %{data: for(task <- tasks, do: data(task))}
  end

  @doc """
  Renders a single task.
  """
  def show(%{task: task}) do
    %{data: data(task)}
  end

  defp data(%Task{} = task) do
    %{
      id: task.id,
      description: task.description,
      completed: task.completed
    }
  end
end
