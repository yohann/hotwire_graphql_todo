# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :toggle, Boolean, null: false do
      argument :task_id, ID, required: true
    end
    def toggle(task_id:)
      Tasks::Toggle.new(task_id).call
    end

    field :create_task, Boolean, null: false do
      argument :name, String, required: true
      argument :description, String, required: true
    end
    def create_task(name:, description:)
      Tasks::Create.new(name, description).call
    end

    field :destroy_task, Boolean, null: false do
      argument :task_id, ID, required: true
    end
    def destroy_task(task_id:)
      Tasks::Destroy.new(task_id).call
    end
  end
end
