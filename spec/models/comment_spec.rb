require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:author) { User.new(:id=>1,:name => "Dulce", :lastname => 'Woof', :email => "dulce@woof.com", :password => "123456", :password_confirmation => "123456") }
  let (:post) {Post.new(:id =>1, :content => Faker::Lorem.sentence, :author => author)}
  let (:comment) {Comment.new(:id=>1, :content=> 'a'*498, :post => post, :commenter => author)}

  describe 'basic validations for comment model' do
    it 'is valid when the length is right, it has an author and a post' do
      post
      byebug
      expect(comment).to be_valid
    end

    it 'is not valid without content' do
      comment.content = nil
      expect(comment).not_to be_valid
    end

    it 'is not valid if the comment exceeds length' do
      comment.content = 'a'*501
      expect(comment).not_to be_valid
    end

    it 'is not valid without author' do
      comment.commenter_id = nil
      expect(comment).not_to be_valid
    end

    it 'is not valid without a post' do
      comment.post_id = nil
      expect(comment).not_to be_valid
    end
  end

  describe 'validating associations' do
    it 'belongs to user' do
      should belong_to(:author) 
    end

    it 'belongs to post' do
      should belong_to(:post)
    end
  end
end