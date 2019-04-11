module JobDaemons
  # Job of SlackTalkDaemon
  class SlackTalkIconUrlJob < JobBase
    attr_reader :channel_id, :name, :icon_emoji, :message

    # Initialize Job.
    # @param [String] channel_id ID of channel.
    # @param [String] name       Name of bot.
    # @param [String] icon_url   Icon emoji of bot.
    # @param [String] message    Message.
    def initialize(channel_id, name, icon_url, message)
      raise 'channel_id should be kind of String' unless channel_id.kind_of?(String)
      raise 'name should be kind of String' unless name.kind_of?(String)
      raise 'icon_url should be kind of String' unless icon_url.kind_of?(String)
      raise 'message should be kind of String' unless message.kind_of?(String)

      @channel_id = channel_id
      @name = name
      @icon_url = icon_url
      @message = message
    end

    # Execute SlackTalk.
    def execute!
      SlackUtils::SingletonClient.instance.send_message_iconurl(@channel_id, @name, @icon_url, @message)
    end
  end
end
