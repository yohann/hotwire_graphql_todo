# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :toggle, Boolean, null: false do
      argument :task_id, ID, required: true
    end

    def toggle(task_id:)
      Tasks::Toggle.new(task_id).call
    end
  end
end
