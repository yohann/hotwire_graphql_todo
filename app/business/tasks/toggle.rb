module Tasks
  class Toggle
    def initialize(task_id)
      @task_id = task_id
    end

    def call
      task = Task.find(@task_id)
      task.complete! unless task.completed?
      task.reopen! unless task.in_progress?
    end
  end
end
