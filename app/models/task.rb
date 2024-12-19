# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status_cd   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  STATES = %i[in_progress completed archived].freeze

  as_enum :state, STATES, map: :string, prefix: true
end
