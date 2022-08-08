require 'rails_helper'
RSpec.describe 'Post Show page', type: :feature do
  describe 'shows users' do
    before(:each) do
      first = User.create(name: 'Keza', photo: 'https://url/picture', bio: 'Information Business',
                          email: 'keza@gmail.com', password: '7654321', post_counter: 1, confirmed_at: Time.now)
      @sec = User.create(name: 'Ben', photo: 'https://url/picture', bio: 'Information Business',
                         email: 'test@test.com', password: '7654321', post_counter: 2, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
      click_button 'Log in'

      @first_post = Post.create(title: 'Here is my post', text: 'here is my post...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @second_post = Post.create(title: 'Earth is big', text: 'to my notblock...', comment_counter: 0, likes_counter: 0,
                                 author: first)
      @third_post = Post.create(title: 'Ruby on rails', text: 'Study rails and ruby together...', comment_counter: 0,
                                likes_counter: 0, author: first)
      @first_comment = Comment.create(text: 'Javascript best language', author: User.first, post: Post.first)

      visit user_post_path(first, @first_post)
    end

    it 'Should show the post of the author' do
      expect(page).to have_content('Keza')
    end

    it 'Should show the number of comments a post has' do
      post_commented = Post.first
      expect(page).to have_content(post_commented.comment_counter)
    end

    it 'Should should show the title' do
      expect(page).to have_content('Here is my post')
    end

    it 'Should be able to see the comments of each commentor.' do
      expect(page).to have_content 'Javascript best language'
    end

    it 'Should show how many likes a post has' do
      post_liked = Post.first
      expect(page).to have_content(post_liked.likes_counter)
    end

    it 'We can see the body of the post' do
      expect(page).to have_content('Study rails and ruby together...')
    end

    it 'Should show the name of the commentator' do
      post = Post.first
      my_comment = post.comments.first
      expect(page).to have_content(my_comment.author.name)
    end
  end
end
