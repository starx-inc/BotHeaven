require 'rails_helper'

RSpec.describe Bots::Apis::Setting do
  fixtures :bots
  fixtures :users
  fixtures :storages

  let :bot do
    Bot.find(1).tap do |bot|
      bot.update!(script: script)
    end
  end

  let :script do
    'function test() { return ""; }'
  end

  subject do
    bot.execute_function('test')
  end

  describe '#name' do
    let :script do
      'function test() { return api.setting.name; }'
    end

    it 'Return bot name' do
      expect(subject).to eq(bot.name)
    end
  end

  describe '#icon' do
    let :script do
      'function test() { return api.setting.icon; }'
    end

    it 'Return bot default icon' do
      expect(subject).to eq(bot.default_icon)
    end
  end

  describe '#channel' do
    let :script do
      'function test() { return api.setting.channel; }'
    end

    it 'Return channel name' do
      expect(subject).to eq(bot.channel)
    end
  end

  describe '#user' do
    let :script do
      'function test() { return api.setting.user; }'
    end

    it 'Return creator name' do
      expect(subject).to eq(bot.user.name)
    end
  end
end
