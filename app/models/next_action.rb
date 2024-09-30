class NextAction < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  scope :done, -> { where(done: true) }
end
