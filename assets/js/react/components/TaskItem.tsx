import React from 'react'

type Props = {
  id: number
  description: string
  completed: boolean
  deleteItem: (id: number) => void
  completeItem: (id: number) => void
}

export default function TaskItem({
  id,
  description,
  completed,
  deleteItem,
  completeItem,
}: Props) {
  const handleDelete = async (id) => {
    deleteItem(id)
  }
  const handleComplete = async (id) => {
    completeItem(id)
  }

  return (
    <div className="task-item">
      <p>
        <span className={completed ? 'line-through' : ''}>{description}</span>
      </p>
      <div className="task-actions">
        <button onClick={() => handleComplete(id)} className="button">
          Complete
        </button>
        <button onClick={() => handleDelete(id)} className="button">
          Remove
        </button>
      </div>
    </div>
  )
}
