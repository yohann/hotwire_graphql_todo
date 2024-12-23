require 'rails_helper'

describe Tasks::Destroy do
  subject { Tasks::Destroy.new(task.id).call }

  let(:task) { create(:task) }

  it "must destroy the task" do
    subject
    expect { task.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
