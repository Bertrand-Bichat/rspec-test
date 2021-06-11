require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'comments association' do
    it 'should increment comments_count when a new comment is created' do
      Post.destroy_all
      Comment.destroy_all
      user = User.create(email: 'test@gmail.com', password: 'password')
      user2 = User.create(email: 'example@gmail.com', password: 'password')
      post = build(:post, user: user)
      post.save
      comment = build(:comment, post: post, user: user2)
      comment.save
      expect(User.count).to eq(2)
      expect(Post.count).to eq(1)
      expect(Comment.count).to eq(1)
      expect(post.comments_count).to eq(1)
    end
  end

  it 'should persist a post' do
    Post.destroy_all
    Comment.destroy_all
    user = User.create(email: 'test@gmail.com', password: 'password')
    post = build(:post, user: user)
    post.save
    expect(Post.count).to eq(1)
  end
end
