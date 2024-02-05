import Title from "./components/Title";
import React from "react";
import TaskForm from "./components/TaskForm";
import TaskList from "./components/TaskList";
import { useState } from "react";

export default function App() {
  const [tasks, setTasks] = useState({});

  return (
    <div className="title">
      <Title
        title="What do you have to do today?"
        subtitle="Phoenix + Typescript + React"
      />
      <TaskForm setTasks={setTasks} />
      <TaskList tasks={tasks} setTasks={setTasks} />
    </div>
  );
}
