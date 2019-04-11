# Storage of bot.
# @attr [String] content
class Storage < ApplicationRecord
  belongs_to :bot, inverse_of: :storage

  validates :bot,     presence: true
  validates :content, length: {maximum: (ENV['BOT_STORAGE_MAXIMUM_SIZE'] || 128.kilobytes).to_i}
end
