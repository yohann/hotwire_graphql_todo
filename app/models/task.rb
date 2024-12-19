# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  state_cd    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  include(AASM)

  STATES = %i[in_progress completed archived].freeze

  as_enum :state, STATES, map: :string, prefix: true

  aasm(:state, column: :state_cd) do
    state :in_progress, initial: true
    state :completed, :archived

    event :complete do
      transitions from: :in_progress, to: :completed
    end

    event :archive do
      transitions from: :in_progress, to: :archived
    end

    event :reopen do
      transitions from: [ :archived, :completed ], to: :in_progress
    end
  end
end
