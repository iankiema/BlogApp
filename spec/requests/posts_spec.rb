# spec/requests/posts_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :request do
  fixtures :users, :posts

  describe 'GET #index' do
    it 'returns a successful response' do
      get user_posts_path(users(:user_one).id)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(users(:user_one).id)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(users(:user_one).id)
      expect(response.body).to include('All Posts by a Given User')
    end
  end

  describe 'GET #show' do
    let(:post) { posts(:post_one) }

    it 'returns a successful response' do
      get user_post_path(post.user.id, post.id)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get user_post_path(post.user.id, post.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(post.user.id, post.id)
      expect(response.body).to include('Single Post')
    end
  end
end
