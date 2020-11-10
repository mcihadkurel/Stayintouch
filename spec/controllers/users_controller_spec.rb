require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'request list of all users' do
    before(:each) do
      @user = FactoryBot.create(:user)
      login_as(@user, scope: :user)
    end
    it 'get the user on users page' do
      user = @user
      get '/users'
      expect(response).to be_successful
      expect(response.body).to include('Dodo')
    end
  end
end
