class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :with_area, -> { where.not(area: nil).where.not(area: "") }
  scope :without_area, -> { where(area: nil).or(where(area: "")) }

  scope :grouped_by_area, -> { with_area.order("area ASC, name ASC").group_by(&:area) }

  scope :with_waiting_for, -> { where.not(waiting_for: [ nil, "" ]) }
  scope :without_waiting_for, -> { where(waiting_for: [ nil, "" ]) }

  scope :active, -> { without_waiting_for }
  scope :inactive, -> { with_waiting_for }

  has_many :next_actions, dependent: :destroy

  def inactive?
    Project.inactive.exists?(id)
  end

  def active?
    !inactive?
  end
end
