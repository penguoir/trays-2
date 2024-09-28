class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :inbox_items, dependent: :destroy
  has_many :projects, dependent: :destroy

  def pinned_inbox_item
    inbox_items.find_by(pinned: true)
  end
end
