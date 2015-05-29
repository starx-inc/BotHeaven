module Bots::Apis
  # AlarmAPI class of Bot.
  class Alarm
    # Initialize class.
    # @param [Bot] bot instance of bot.
    def initialize(bot)
      @bot = bot
    end

    # Set alarm.
    # @param [String]  alarm_name Name of alarm.
    # @param [String]  callback   Name of callback.
    # @param [Float]   minutes    Minutes.(x >= 0.25)
    # @param [Boolean] repeat     Enabled repeat.
    # @return [Boolean] true if success.
    def regist(alarm_name, callback, minutes, repeat)
      minutes = (minutes < 0.25) ? 0.25 : minutes.to_f
      ::Alarm.set!(alarm_name.to_s, @bot, callback.to_s, minutes, repeat == true)
      true
    rescue
      false
    end

    # Remove alarm.
    # @param [String] alarm_name Name of alarm.
    # @return [Boolean] true if success.
    def remove(alarm_name)
      @bot.alarms.where(name: alarm_name.to_s).destroy_all
      true
    rescue
      false
    end

    # Get all alarm names.
    # @return [Array<String>] alarm names.
    def all
      @bot.alarms.map(&:name)
    rescue
      nil
    end

    # Clear all alarm.
    # @note This argument is necessary to recognize it to be a function.
    # @return [Boolean] true if success.
    def clear(dummy=true)
      @bot.alarms.destroy_all
      true
    rescue
      false
    end
  end
end
