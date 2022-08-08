require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Jane', photo: 'https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f4/3d/47/f43d470e-4768-9309-e6aa-1fa5fa3e7b33/AppIcon-0-0-85-220-0-0-0-0-4-0-0-0-2x-sRGB-0-0-0-0-0.png/1200x630bb.png',
             bio: 'Girl in hollyday', post_counter: 2)
  end

  before { subject.save }

  it 'Should should check if the name is present' do
    subject.name = ''
    expect(User.new).to_not be_valid
  end

  it 'Should post counter to be greater or equal to 0' do
    subject.post_counter = nil
    expect(User.new).to_not be_valid
  end

  it 'Should post counter to be only an integer' do
    subject.post_counter = '2'
    expect(User.new).to_not be_valid
  end

  it 'Should return recent posts and should render only 3 recent post' do
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end
end
