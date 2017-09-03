module Bots::Apis
  # SettingAPI class of Bot.
  class Setting
    # Initialize class.
    # @param [Bot] bot instance of bot.
    def initialize(bot)
      @bot = bot
    end

    # Get bot name
    # @return [String] bot name
    def name
      @bot.name
    end

    # Get bot default icon
    # @return [String] emoji name
    def icon
      @bot.default_icon
    end

    # Get joined channel
    # @return [String] channel name
    def channel
      @bot.channel
    end

    # Get creator name
    # @return [String] user name
    def user
      @bot.user.try(:name)
    end
  end
end
