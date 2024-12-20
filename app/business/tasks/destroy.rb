module Tasks
  class Destroy
    def initialize(task_id)
      @task_id = task_id
    end

    def call
      task = Task.find(@task_id)
      task.destroy
    end
  end
end
