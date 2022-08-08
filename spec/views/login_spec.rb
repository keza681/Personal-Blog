require 'rails_helper'

describe 'Login page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Linda', photo: 'https://url/pictures', bio: 'Business', email: 'linda@icloud.com',
                         password: '7654321', post_counter: 0, confirmed_at: Time.now)
  end

  it 'Should show my log in page view' do
    visit root_path
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Remember me'
  end

  it 'Should render the page with wrong credentials' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'ke@gmail.com'
      fill_in 'Password', with: '7654lk21'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Credentials (Email or password)'
  end

  it 'Should not login without filling password' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'ke@gmail.com'
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Credentials (Email or password)'
  end

  it 'Should login with correct credentials(email and password)' do
    @user = User.create(name: 'Linda', bio: 'Business', email: 'linda@icloud.com', password: '7654321',
                        post_counter: 0, confirmed_at: Time.now)

    visit root_path
    within('body') do
      fill_in 'Email', with: 'linda@icloud.com'
      fill_in 'Password', with: '7654321'
    end
    click_button 'Log in'
    expect(page).to have_content 'Linda'
  end
end
