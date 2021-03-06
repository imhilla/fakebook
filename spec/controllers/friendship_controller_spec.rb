require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  before(:all) do
    User.create(name: 'hasan', email: 'ozovalihasan@gmail.com', password: '123456')
    User.create(name: 'hillary', email: 'hillary@gmail.com', password: '123456')
    User.first.friendships.create(friend_id: User.second.id)
  end

  describe '#edit' do
    it 'creates two friendships for the same two users' do
      expect do
        post :edit, params: { id: 1 }
      end.to change(Friendship, :count).by(1)
    end
  end
end
