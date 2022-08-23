require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abiodun', photo: 'https://unsplash.com/photos/XPTwNe15dtw', bio: 'Am  a junior web developer', posts_counter: 0) }
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
