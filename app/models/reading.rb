class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum :status, { want_to_read: 0, currently_reading: 1, read: 2 }

  def finish!
    update(status: :read, finished_at: Date.today) unless read?
  end
end
