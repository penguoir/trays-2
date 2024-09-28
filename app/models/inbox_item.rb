class InboxItem < ApplicationRecord
  belongs_to :user
  before_save :unpin_other_inbox_items, if: :pinned?

  private

  def unpin_other_inbox_items
    user.inbox_items.where.not(id: id).update_all(pinned: false)
  end
end
