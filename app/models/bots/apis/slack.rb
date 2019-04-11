module Bots::Apis
  # AlarmAPI class of Bot.
  class Slack
    # Initialize class.
    # @param [Bot] bot instance of bot.
    def initialize(bot)
      @bot = bot
    end

    # Talk
    # @param [String] message message.
    # @param [Hash] options options.
    # @return [Boolean] true if success.
    def talk(message, options = {})
      JobDaemon.enqueue(
        JobDaemons::SlackTalkJob.new(
          @bot.channel_id.to_s,
          options['name'] || @bot.name.to_s,
          options['icon'] || @bot.default_icon.to_s,
          message.to_s
        )
      )
      true
    rescue
      false
    end

    # Talk with icon
    # @param [String] message     message.
    # @param [String] icon_emoji emoji icon.
    # @return [Boolean] true if success.
    def talk_with_icon(message, icon_emoji)
      talk(message, {icon: icon_emoji})
    rescue
      false
    end

    # Talk with icon url
    # @param [String] message     message.
    # @param [String] icon_url icon url.
    # @return [Boolean] true if success.
    def talk_with_icon_url(message, icon_url)
      JobDaemon.enqueue(
        JobDaemons::SlackTalkIconUrlJob.new(
          @bot.channel_id.to_s,
          @bot.name.to_s,
          icon_url,
          message.to_s
        )
      )
      true
    rescue
      false
    end
  end
end
