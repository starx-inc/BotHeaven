require 'rails_helper'

RSpec.describe Storage, type: :model do
  fixtures :bots
  fixtures :users
  fixtures :storages

  let :storage do
    Storage.find(1)
  end

  describe '#bot' do
    it 'Presence' do
      expect(storage).to validate_presence_of(:bot)
    end
  end
end
