class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :without_area, -> { where(area: nil).or(where(area: "")) }

  scope :grouped_by_area, -> {
    Project
      .where.not(area: nil)
      .where.not(area: "")
      .order("area ASC, name ASC")
      .group_by(&:area)
  }
end
