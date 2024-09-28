class Project < ApplicationRecord
  include Incubation

  belongs_to :user

  validates :name, presence: true

  scope :with_area, -> { where.not(area: nil).where.not(area: "") }
  scope :without_area, -> { where(area: nil).or(where(area: "")) }

  scope :grouped_by_area, -> { with_area.order("area ASC, name ASC").group_by(&:area) }

  scope :with_waiting_for, -> { where.not(waiting_for: [ nil, "" ]) }
  scope :without_waiting_for, -> { where(waiting_for: [ nil, "" ]) }

  scope :incubating, -> { where.not(stops_incubating_at: nil) }
  scope :not_incubating, -> { where(stops_incubating_at: nil) }

  scope :active, -> { without_waiting_for.not_incubating }
  scope :inactive, -> { with_waiting_for.or(incubating) }

  has_many :next_actions, dependent: :destroy

  before_validation :set_stops_incubating_at
  validate :incubating_until_is_a_date
  validate :validate_incubating_fields

  def inactive?
    Project.inactive.exists?(id)
  end

  def active?
    !inactive?
  end

  private

  def validate_incubating_fields
    if incubating_until.present? && stops_incubating_at.blank?
      errors.add(:stops_incubating_at, "must be present if incubating_until is present")
    elsif stops_incubating_at.present? && incubating_until.blank?
      errors.add(:incubating_until, "must be present if stops_incubating_at is present")
    end
  end

  def incubating_until_is_a_date
    if incubating_until.present? && Chronic.parse(incubating_until).blank?
      errors.add(:incubating_until, "must be a valid date")
    end
  end

  def set_stops_incubating_at
    self.stops_incubating_at = Chronic.parse(incubating_until) if incubating_until.present?
    self.stops_incubating_at = nil if incubating_until.blank?
  end
end
