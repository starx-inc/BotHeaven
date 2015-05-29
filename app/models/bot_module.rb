# Module of Bot.
# @attr [String]                   name        Name of Module.
# @attr [String]                   description Description of Module.
# @attr [String]                   script      Script of Module.
# @attr [User]                     user        Author of Module.
# @attr [BotModules::Permissions]  permission  Permission of Module.
class BotModule < ActiveRecord::Base
  belongs_to :user, inverse_of: :bot_modules
  has_many :bot_bot_modules, inverse_of: :bot_module, dependent: :destroy
  has_many :bots, through: :bot_bot_modules

  bind_inum :permission, BotModules::Permissions

  validates :name,        length: {in: 1..32}, presence: true
  validates :description, length: {maximum: 128}
  validates :script,      length: {in: 1..64.kilobytes}, presence: true
  validates :user,        presence: true


  scope :belongings, -> (user_id) {
    where(user_id: user_id)
  }
  scope :public_modules, -> {
    where(permission: BotModules::Permissions::PUBLIC_MODULE.to_i)
  }
  scope :usable, -> (bot) {
    base_scope = BotModule.belongings(bot.user_id).public_modules
    where(base_scope.where_values.reduce(:or)).tap {|s| s.bind_values += base_scope.bind_values}
  }

  # Check if owner.
  # @param [User] user
  # @return [Boolean] true if user is owner.
  def owner?(user)
    if user
      self.user_id == user.id
    else
      false
    end
  end

  # Check if has permission for read.
  # @param [User] user User
  # @return [Boolean] true if user has permission.
  def readable?(user)
    owner?(user) || permission != BotModules::Permissions::PRIVATE_MODULE
  end

  # Check if usable Module
  # @param [User] user User
  # @return [Boolean] true if module is usable.
  def usable?(user)
    owner?(user) || permission == BotModules::Permissions::PUBLIC_MODULE
  end
end
