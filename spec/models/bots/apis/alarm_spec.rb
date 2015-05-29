require 'rails_helper'

RSpec.describe Bots::Apis::Alarm do
  fixtures :bots
  fixtures :users
  fixtures :alarms
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

  describe '#regist' do
    let :script do
      'function test() { return api.alarm.regist("hoge", "callbackfunc", ' + minutes.to_s + ', false); }'
    end

    let :minutes do
      1
    end

    it 'Add alarm' do
      expect {
        subject
      }.to change(Alarm, :count).by(1)
    end

    it 'Return true' do
      expect(subject).to eq(true.to_s)
    end

    context 'When minutes < 0.25' do
      let :minutes do
        0
      end

      it 'Alarm minutes be 0.25' do
        subject
        expect(Alarm.last.minutes).to eq(0.25)
      end
    end
  end

  describe '#remove' do
    let :script do
      'function test() { return api.alarm.remove("schedule"); }'
    end

    it 'Remove alarm' do
      expect {
        subject
      }.to change(Alarm, :count).by(-1)
    end

    it 'Return true' do
      expect(subject).to eq(true.to_s)
    end
  end

  describe '#all' do
    let :script do
      'function test() { return api.alarm.all; }'
    end

    it 'Return all alarm names.' do
      expect(subject).to eq(bot.alarms.map(&:name).join(','))
    end
  end

  describe '#clear' do
    let :script do
      'function test() { return api.alarm.clear(); }'
    end

    it 'Remove all alarms' do
      expect {
        subject
      }.to change(Alarm, :count).by(-bot.alarms.count)
    end

    it 'Return true' do
      expect(subject).to eq(true.to_s)
    end
  end
end
