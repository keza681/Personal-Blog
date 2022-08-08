require 'rails_helper'

describe 'Index page for user', type: :feature do
  before :each do
    @user1 = User.create(name: 'Keza', photo: 'https://url/picture', bio: 'Information Business', email: 'keza@gmail.com',
                         password: '7654321', post_counter: 1, confirmed_at: Time.now)
    @user2 = User.create(name: 'Ben', photo: 'https://url/picture', bio: 'Information Business', email: 'test@test.com',
                         password: '7654321', post_counter: 2, confirmed_at: Time.now)
  end

  it 'Can see userma of all users' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Keza'
    expect(page).to have_content 'Ben'
  end

  it 'Should show number of posts' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 0'
  end

  it 'Should show profile picture for each users' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'keza@gmail.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_css("img[src*='https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/f4/3d/47/f43d470e-4768-9309-e6aa-1fa5fa3e7b33/AppIcon-0-0-85-220-0-0-0-0-4-0-0-0-2x-sRGB-0-0-0-0-0.png/1200x630bb.png']")
  end
end