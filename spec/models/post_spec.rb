require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation test' do
    let(:post) { Post.create(content: 'Hello there, this is my first post') }
    it 'ensure name is present' do
      post.content = nil
      expect(post.save).to eq(false)
    end
  end
  context 'associations' do
    it 'should belongs to a user' do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many comments' do
      t = Post.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many likes' do
      t = Post.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
  end
end
