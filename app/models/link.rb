class Link < ApplicationRecord
  validates :name, presence: true
  validates :url, url: true, presence: true

  def update_status(status)
    self.read = true if status == "read"
    self.read = false if status == "unread"
  end
end
