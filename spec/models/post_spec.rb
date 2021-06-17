require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'comments association' do
    it 'should increment comments_count when a new comment is created' do
      user = create(:user)
      user2 = create(:user)
      post = create(:post, user: user)
      create(:comment, post: post, user: user2)
      expect(User.count).to eq(2)
      expect(Post.count).to eq(1)
      expect(Comment.count).to eq(1)
      expect(post.comments_count).to eq(1)
    end
  end

  it 'should persist a post' do
    user = create(:user)
    create(:post, user: user)
    expect(Post.count).to eq(1)
  end
end

