require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation' do
    it 'should validate content length' do
      comment = build(:comment_empty)
      expect(comment.valid?).to be false
    end

    it 'should accept a good content' do
      user = User.create(email: 'test@gmail.com', password: 'password')
      post = create(:post, user: user)
      comment = build(:comment, post: post, user: user)
      comment.validate
      expect(comment.valid?).to be true
    end
  end
end
