require 'rails_helper'

RSpec.describe Like, type: :model do
  let (:author) { User.new(:id=>1,:name => "Dulce", :lastname => 'Woof', :email => "dulce@woof.com", :password => "123456", :password_confirmation => "123456") }
  let (:post1) {Post.new(:id =>3, :content => Faker::Lorem.sentence, :author => author)}
  let (:like) {Like.new(:id=>1, :liker=> author, :post=> post1)}

  describe 'doing basic validations' do
    it 'is valid when it has a post and an user assigned'do
      expect(like).to be_valid
    end

    it 'is not valid when post is not present' do
      like.post = nil
      expect(like).not_to be_valid
    end

    it 'is not valid when user is not present'do
      like.liker = nil
      expect(like).not_to be_valid
    end
  end

  describe 'doing associations validations' do
    it 'belongs to user'do
      should belong_to(:liker)
    end

    it 'belongs to post'do
      should belong_to(:post)
    end
  end
end
