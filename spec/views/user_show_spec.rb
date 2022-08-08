require 'rails_helper'

RSpec.describe 'Show user page', type: :feature do
  describe 'At this page We' do
    before(:each) do
      first = User.create(name: 'Keza', photo: 'https://url/picture', bio: 'Information Business',
                          email: 'keza@gmail.com',
                          password: '7654321', post_counter: 1, confirmed_at: Time.now)
      @sec = User.create(name: 'Ben', photo: 'https://url/picture', bio: 'Information Business',
                         email: 'test@test.com',
                         password: '7654321', post_counter: 2, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '7654321'
      click_button 'Log in'
      @first_post = Post.create(title: 'Here is my post', text: 'sky is the limit...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @second_post = Post.create(title: 'Earth is big', text: 'to my notblock...', comment_counter: 0, likes_counter: 0,
                                 author: first)
      @third_post = Post.create(title: 'Ruby on rails', text: 'Study rails and ruby together...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @fourth_post = Post.create(title: 'Business life', text: 'Voila pourquoi le code est bon...',
                                 comment_counter: 0, likes_counter: 0, author: first)
      visit user_path(first.id)
    end
    it 'Should show profile picture' do
      expect(page).to have_css("img[src*='https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f4/3d/47/f43d470e-4768-9309-e6aa-1fa5fa3e7b33/AppIcon-0-0-85-220-0-0-0-0-4-0-0-0-2x-sRGB-0-0-0-0-0.png/1200x630bb.png']")
    end

    it "Should see user's username" do
      expect(page).to have_content 'Keza'
    end

    it "Should see the user's bio" do
      expect(page).to have_content('Information Business')
      visit user_session_path
    end

    it 'Should see a link to all posts of the user.' do
      expect(page).to have_link('See all posts')
    end
  end
end
