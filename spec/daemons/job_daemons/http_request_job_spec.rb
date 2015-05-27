require 'rails_helper'

describe JobDaemons::HTTPRequestJob do
  fixtures :bots
  fixtures :users

  let :job do
    JobDaemons::HTTPRequestJob.new(Bot.find(1).id, 'callback', method, 'http://www.yahoo.co.jp/', {})
  end

  let :method do
    :get
  end

  describe '#execute!' do
    subject do
      job.execute!
      sleep(1) # Wait to wakeup Thread.
    end

    it 'Call Net::HTTP.get' do
      expect(Net::HTTP).to receive(:get).once
      subject
    end

    it 'Enqueue Bot Job' do
      allow(Net::HTTP).to receive(:get)
      expect(JobDaemon).to receive(:enqueue).once
      subject
    end

    context 'When post' do
      let :method do
        :post
      end

      it 'Call Net::HTTP.post_form' do
        expect(Net::HTTP).to receive(:post_form).once
        subject
      end
    end

    context 'When raise error' do
      it 'Enqueue Bot Job' do
        expect(Net::HTTP).to receive(:get) { raise }
        expect(JobDaemon).to receive(:enqueue).once
        subject
      end
    end
  end
end
