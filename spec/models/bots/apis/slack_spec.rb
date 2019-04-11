require 'rails_helper'

RSpec.describe Bots::Apis::Slack do
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

  describe '#talk' do
    context 'no option' do
      let :script do
        'function test() { return api.slack.talk("hey!"); }'
      end

      it 'Enqueue SlackTalkJob.' do
        expect(JobDaemon).to receive(:enqueue).once
        subject
      end

      it 'Return true' do
        expect(subject).to eq(true.to_s)
      end
    end

    context 'has option' do
      let :script do
        'function test() { return api.slack.talk("options!", { name: "slack_bot", icon: "+1"}); }'
      end

      it 'Enqueue SlackTalkJob.' do
        expect(JobDaemon).to receive(:enqueue).once
        subject
      end

      it 'Return true' do
        expect(subject).to eq(true.to_s)
      end
    end
  end

  describe '#talk_with_icon' do
    let :script do
      'function test() { return api.slack.talk_with_icon("year!", "hoge"); }'
    end

    it 'Enqueue SlackTalkJob.' do
      expect(JobDaemon).to receive(:enqueue).once
      subject
    end

    it 'Return true' do
      expect(subject).to eq(true.to_s)
    end
  end

  describe '#talk_with_icon_url' do
    let :script do
      'function test() { return api.slack.talk_with_icon_url("year!", "http://hoge/"); }'
    end

    it 'Enqueue SlackTalkIconUrlJob.' do
      expect(JobDaemon).to receive(:enqueue).once
      subject
    end

    it 'Return true' do
      expect(subject).to eq(true.to_s)
    end
  end
end
