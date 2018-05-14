# Storage of bot.
# @attr [String] content
class Storage < ApplicationRecord
  belongs_to :bot, inverse_of: :storage

  validates :bot,     presence: true
  validates :content, length: {maximum: 128.kilobytes}
end
