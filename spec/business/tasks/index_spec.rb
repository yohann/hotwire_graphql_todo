require 'rails_helper'

describe Tasks::Index do
  subject { Tasks::Index.new.call }

  let!(:task) { FactoryBot.create(:task) }

  it "must return all tasks" do
    tasks = subject
    expect(tasks.size).to eq(1)
    expect(tasks.first.name).to eq(task.name)
    expect(tasks.first.description).to eq(task.description)
  end
end
