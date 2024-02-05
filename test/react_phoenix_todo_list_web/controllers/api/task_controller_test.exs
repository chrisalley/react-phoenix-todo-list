defmodule ReactPhoenixTodoListWeb.Api.TaskControllerTest do
  use ReactPhoenixTodoListWeb.ConnCase

  import ReactPhoenixTodoList.TodoFixtures

  alias ReactPhoenixTodoList.Todo.Task

  @create_attrs %{
    description: "some description",
    completed: true
  }
  @update_attrs %{
    description: "some updated description",
    completed: false
  }
  @invalid_attrs %{description: nil, completed: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasks", %{conn: conn} do
      conn = get(conn, ~p"/api/api/tasks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task" do
    test "renders task when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/tasks", task: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api/tasks/#{id}")

      assert %{
               "id" => ^id,
               "completed" => true,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/tasks", task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task" do
    setup [:create_task]

    test "renders task when data is valid", %{conn: conn, task: %Task{id: id} = task} do
      conn = put(conn, ~p"/api/api/tasks/#{task}", task: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api/tasks/#{id}")

      assert %{
               "id" => ^id,
               "completed" => false,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task: task} do
      conn = put(conn, ~p"/api/api/tasks/#{task}", task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task" do
    setup [:create_task]

    test "deletes chosen task", %{conn: conn, task: task} do
      conn = delete(conn, ~p"/api/api/tasks/#{task}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api/tasks/#{task}")
      end
    end
  end

  defp create_task(_) do
    task = task_fixture()
    %{task: task}
  end
end
