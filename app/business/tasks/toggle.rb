module Tasks
  class Toggle
    def initialize(task_id)
      @task_id = task_id
    end

    def call
      task = Task.find(@task_id)
      task.completed? ? task.reopen! : task.complete!
    end
  end
end
