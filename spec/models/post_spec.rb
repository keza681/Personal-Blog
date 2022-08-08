require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Jane',
                           photo: 'https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f4/3d/47/f43d470e-4768-9309-e6aa-1fa5fa3e7b33/AppIcon-0-0-85-220-0-0-0-0-4-0-0-0-2x-sRGB-0-0-0-0-0.png/1200x630bb.png',
                           bio: 'Girl in hollyday')
  subject { Post.create(author: first_user, title: 'Bonjour', text: 'Here is me in America') }

  before { subject.save }

  it 'Should check if the Title is present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'Should return all the comments for a post' do
    expect(Comment.count).to eql 0
  end

  it 'Should Retun 5 recent comments' do
    expect(subject.recent_comments).to eq(subject.comments.last(5))
  end

  it 'Should Should retun the update post' do
    expect(Post.count).to eq 0
  end
end
