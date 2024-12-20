require 'rails_helper'

describe Tasks::Create do
  subject { Tasks::Create.new(name, description).call }

  let(:name) { "Title" }
  let(:description) { "Description" }

  it "must create a task" do
    expect { subject }.to change { Task.count }.by(1)
  end

  it "must return the task" do
    task = subject
    expect(task.name).to eq("Title")
    expect(task.description).to eq("Description")
  end
end
