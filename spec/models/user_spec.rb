require 'rails_helper'

RSpec.describe User, type: :model do
  context '#import' do
    it 'should return the right name' do
      user = create(:user)
      allow(user).to receive(:callAPI).and_return('[{"name": "John Doe"}, {}, {}]')
      expect(user).to receive(:callAPI).with('https://jsonplaceholder.typicode.com/users')
      expect(user.import).to eq('John Doe')
    end
  end
end
