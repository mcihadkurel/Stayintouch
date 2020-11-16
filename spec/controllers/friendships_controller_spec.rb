require 'rails_helper'

RSpec.describe 'Friendship', type: :request do
  describe 'request list of all users' do
    before(:each) do
      @user = FactoryBot.create(:user)
      login_as(@user, scope: :user)
    end

    it 'get the user on users page' do
      user = @user
      get users_url
      expect(response).to be_successful
      expect(response.body).to include('Dodo')
    end
  end

  context 'if user not logged in' do
    it 'redirects to sign in' do
      get posts_url
      redirect_to new_user_session_url
    end
  end

  describe 'POST #Create' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:second_user)
      login_as(@user, scope: :user)
    end

    it 'create friendship' do
      post invite_path, params: { friendship: { user: @user, friend: @user2, confirmed: true } }
      redirect_to users_path
    end
  end
end
