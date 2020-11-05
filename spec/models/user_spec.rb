require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", name: "Jon")
    end

    it 'should be able to be created if valid' do
      expect(@user).to be_valid
    end

  end

  context 'validation test' do
    let(:user) { User.create(email: "test@test.com", password: "password", password_confirmation: "password", name: "Jon") } 
    it 'ensure name is present' do
      user.name = nil
      expect(user.save).to eq(false)
    end
  end
  context 'associations' do
    it 'should have many posts' do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many comments' do
      t = User.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many likes' do
      t = User.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many friendships' do
      t = User.reflect_on_association(:friendships)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many friends' do
      t = User.reflect_on_association(:friends)
      expect(t.macro).to eq(:has_many)
    end
  end
end