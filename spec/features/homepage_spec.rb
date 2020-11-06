require 'rails_helper'

describe 'navigate' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
