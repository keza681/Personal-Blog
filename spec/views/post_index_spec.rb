require 'rails_helper'

describe 'Posts page', type: :feature do
  before :each do
    first = User.create(name: 'Keza', photo: 'https://url/picture', bio: 'Information Business',
                        email: 'keza@gmail.com', password: '7654321', post_counter: 1, confirmed_at: Time.now)
    @sec = User.create(name: 'Ben', photo: 'https://url/picture', bio: 'Information Business',
                       email: 'test@test.com', password: '7654321', post_counter: 2, confirmed_at: Time.now)

    @first_post = Post.create(title: 'Here is my post', text: 'here is my post...', comment_counter: 0,
                              likes_counter: 0, author: first)
    @second_post = Post.create(title: 'Earth is big', text: 'to my notblock...', comment_counter: 0, likes_counter: 0,
                               author: first)
    @third_post = Post.create(title: 'Ruby on rails', text: 'Study rails and ruby together...', comment_counter: 0,
                              likes_counter: 0, author: first)
    @first_comment = Comment.create(text: 'Javascript best language', author: User.first, post: Post.first)
  end

  it 'Should show username of the user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Keza'
  end

  it 'Should see the profile picture of the user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_css(
      "img[src*='https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f4/3d/47/f43d470e-4768-9309-e6aa-1fa5fa3e7b33/AppIcon-0-0-85-220-0-0-0-0-4-0-0-0-2x-sRGB-0-0-0-0-0.png/1200x630bb.png']"
    )
  end

  it 'Should see all numbers of all posts' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    number_of_post = Post.all
    expect(number_of_post.size).to eql(3)
  end

  it 'Should show the number of comments' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 3'
  end

  it 'Should show the name of commnentators' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Keza'
  end
end
