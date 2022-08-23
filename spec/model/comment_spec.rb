require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @comment = Comment.new(text: 'One comment', user_id: 2, post_id: 4)
    end

    before { @comment.save }

    it 'if title is present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'if author_id is integer' do
      @comment.user_id = 'W'
      expect(@comment).to_not be_valid
    end

    it 'if post_id is integer' do
      @comment.post_id = 'Q'
      expect(@comment).to_not be_valid
    end

    it 'if author_id is present' do
      @comment.user_id = false
      expect(@comment).to_not be_valid
    end

    it 'if post_id is present' do
      @comment.post_id = nil
      @comment.user_id = nil
      expect(@comment).to_not be_valid
    end

    it 'if author_id is not present' do
      @comment.user_id = nil
      expect(@comment).to_not be_valid
    end

    it 'if post_id is not present' do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end
  end
end
