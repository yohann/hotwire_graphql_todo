require 'rails_helper'

describe Tasks::Update do
  subject { Tasks::Update.new(task.id, name, description).call }

  let!(:task) { FactoryBot.create(:task) }
  let(:name) { "New Title" }
  let(:description) { "New Description" }

  it "must update the task" do
    subject
    expect(task.reload.name).to eq("New Title")
    expect(task.reload.description).to eq("New Description")
  end
end
