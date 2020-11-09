require 'rails_helper'

RSpec.describe 'Friendship', type: :request do
    describe 'request list of all users' do
        before(:each) do
          @user = FactoryBot.create(:user)
          login_as(@user, scope: :user)
        end
    
end
