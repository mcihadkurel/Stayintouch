require 'rails_helper'

describe 'navigate' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'users page' do
    it 'can see multiple user' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:second_user)
      visit users_path
      expect(page).to have_content(/Dodo|Pete/)
    end
  end
end
