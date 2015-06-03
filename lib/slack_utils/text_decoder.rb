module SlackUtils
  # Text decoder of Slack.
  class TextDecoder
    # Decode Slack Text.
    # @param [String] text text.
    # @return [String] decoded text.
    def self.decode(text)
      decoded_text = text.gsub(/<[^>]+>/) do |slack_escaped_string|
        content = slack_escaped_string.slice(1, slack_escaped_string.length - 2)
        case content[0]
        when '@'
          SlackUtils::SingletonClient.instance.find_user_name(content[1..-1])
        when '#'
          SlackUtils::SingletonClient.instance.find_channel_name(content[1..-1])
        else
          content
        end
      end
      CGI.unescapeHTML(decoded_text)
    end
  end
end
