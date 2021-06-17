require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do

    context '# invalid params' do
      before do
        user1 = create(:user)
        user2 = create(:user)
        test_post = create(:post, user: user1)
        post :create, params: { post_id: test_post.id, user_id: user2.id, comment: attributes_for(:comment_empty) }
      end
      it 'should return an error' do
        expect(response).to have_http_status(422)
      end
      it 'should contain the error' do
        json = JSON.parse(response.body)
        expect(json).to include('content')
      end
    end

    context '# valid params' do
      before do
        user1 = create(:user)
        user2 = create(:user)
        test_post = create(:post, user: user1)
        post :create, params: { post_id: test_post.id, user_id: user2.id, comment: attributes_for(:comment) }
      end
      it 'should return a 200 status' do
        expect(response).to have_http_status(200)
      end
      it 'should contain the comment' do
        json = JSON.parse(response.body)
        expect(json).to include('content')
        expect(json).to include('id')
      end
      it 'comment persisted' do
        expect(Comment.count).to eq(1)
      end
      it 'should attach the comment to the right post' do
        expect(Post.first.comments.count).to eq(1)
      end
    end

  end
end
