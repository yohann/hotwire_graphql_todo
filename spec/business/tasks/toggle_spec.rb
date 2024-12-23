require 'rails_helper'

describe "Tasks::Toggle" do
  subject { Tasks::Toggle.new(task.id).call }

  let(:task) { create(:task, state_cd: state_cd) }

  describe "when state_cd is in_progress" do
    let(:state_cd) { :in_progress }

    before { subject }

    it "must toggle to completed" do
      expect(task.reload.state).to eq(:completed)
    end
  end

  describe "when state_cd is completed" do
    let(:state_cd) { :completed }

    before { subject }

    it "must toggle to in_progress" do
      expect(task.reload.state).to eq(:in_progress)
    end
  end
end
