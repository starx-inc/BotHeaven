require 'rails_helper'

describe SlackUtils::TextDecoder do
  describe '.decode' do
    subject do
      SlackUtils::TextDecoder.decode(text)
    end

    let :text do
      'Hello!'
    end

    it 'decode' do
      expect(subject).to eq('Hello!')
    end

    context 'When include user' do
      let :text do
        'Hoge<@U252525>Piyo'
      end

      it 'decode' do
        allow(SlackUtils::SingletonClient.instance).to receive(:find_user_name).and_return('Fuga')
        expect(subject).to eq('HogeFugaPiyo')
      end
    end

    context 'When include channel' do
      let :text do
        'Hoge<#C252525>Piyo'
      end

      it 'decode' do
        allow(SlackUtils::SingletonClient.instance).to receive(:find_channel_name).and_return('Fuga')
        expect(subject).to eq('HogeFugaPiyo')
      end
    end

    context 'When include link' do
      let :text do
        'Hoge<http://www.google.co.jp>Piyo'
      end

      it 'decode' do
        expect(subject).to eq('Hogehttp://www.google.co.jpPiyo')
      end
    end
  end
end
