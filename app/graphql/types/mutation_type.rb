# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :toggle_task, Boolean, null: false do
      argument :task_id, ID, required: true
    end
    def toggle_task(task_id:)
      Tasks::Toggle.new(task_id).call
    end

    field :create_task, Boolean, null: false do
      argument :name, String, required: true
      argument :description, String, required: true
    end
    def create_task(name:, description:)
      Tasks::Create.call(name, description)
    end

    field :update_task, Boolean, null: false do
      argument :task_id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
    end
    def update_task(task_id:, name:, description:)
      Tasks::Update.call(name, description)
    end

    field :destroy_task, Boolean, null: false do
      argument :task_id, ID, required: true
    end
    def destroy_task(task_id:)
      Tasks::Destroy.call(task_id)
    end
  end
end
