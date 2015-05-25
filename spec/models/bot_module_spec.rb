require 'rails_helper'

RSpec.describe BotModule, type: :model do
  fixtures :bots
  fixtures :bot_modules
  fixtures :users

  let :bot_module do
    BotModule.find(1)
  end

  let :user do
    User.find(1)
  end

  let :bot do
    Bot.find(1)
  end

  describe '#name' do
    it 'Presence' do
      expect(bot_module).to validate_presence_of(:name)
    end

    it 'Length Range in 1,32' do
      expect(bot_module).to validate_length_of(:name).is_at_least(1).is_at_most(32)
    end
  end

  describe '#description' do
    it 'Length Range in 0,128' do
      expect(bot_module).to validate_length_of(:description).is_at_most(128)
    end
  end

  describe '#user' do
    it 'Presence' do
      expect(bot_module).to validate_presence_of(:user)
    end
  end

  describe '#script' do
    it 'Presence' do
      expect(bot_module).to validate_presence_of(:script)
    end

    it 'Length Range in 1,64kb' do
      expect(bot_module).to validate_length_of(:script).is_at_least(1).is_at_most(64.kilobytes)
    end
  end

  describe '.belongings' do
    subject do
      BotModule.belongings(user)
    end

    it 'Return user having modules.' do
      expect(subject.to_a).to eq(BotModule.all.select{|m| m.user == user})
    end
  end

  describe '.public_modules' do
    subject do
      BotModule.public_modules
    end

    it 'Return public modules.' do
      expect(subject.to_a).to eq(BotModule.all.select{|m| m.permission_public_module?})
    end
  end

  describe '.usable' do
    subject do
      BotModule.usable(bot)
    end

    it 'Return usable modules.' do
      expect(subject.to_a).to eq(BotModule.all.select{|m|
        m.permission_public_module? || m.user == bot.user
      })
    end
  end
end
