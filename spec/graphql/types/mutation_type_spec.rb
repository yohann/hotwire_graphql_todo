require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'toggle_task' do
    let(:task) { create(:task) }
    let(:query) do
      <<~GQL
        mutation {
          toggleTask(id: "#{task.id}")
        }
      GQL
    end

    it 'toggles the task' do
      result = TodoListSchema.execute(query)
      expect(result.dig('data', 'toggleTask')).to be_truthy
    end
  end

  describe 'create_task' do
    let(:query) do
      <<~GQL
        mutation {
          createTask(name: "New Task", description: "Task description")
        }
      GQL
    end

    it 'creates a new task' do
      expect {
        TodoListSchema.execute(query)
      }.to change { Task.count }.by(1)
    end
  end

  describe 'update_task' do
    let(:task) { create(:task) }
    let(:query) do
      <<~GQL
        mutation {
          updateTask(id: "#{task.id}", name: "Updated Task", description: "Updated description")
        }
      GQL
    end

    it 'updates the task' do
      result = TodoListSchema.execute(query)
      task.reload
      expect(task.name).to eq("Updated Task")
      expect(task.description).to eq("Updated description")
    end
  end

  describe 'destroy_task' do
    let!(:task) { create(:task) }
    let(:query) do
      <<~GQL
        mutation {
          destroyTask(id: "#{task.id}")
        }
      GQL
    end

    it 'destroys the task' do
      expect {
        TodoListSchema.execute(query)
      }.to change { Task.count }.by(-1)
    end
  end
end
