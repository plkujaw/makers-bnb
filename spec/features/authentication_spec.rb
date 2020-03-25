feature 'authentication' do

  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in :email, with: 'nottherightemail@example.com'
    fill_in :password, with: 'password123'
    click_button 'Log In'

    expect(page).not_to have_content "Welcome Josie"
    expect(page).to have_content "Please check your email or password"
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Log In'

    expect(page).not_to have_content "Welcome Josie"
    expect(page).to have_content "Please check your email or password"
  end

  scenario 'a user can sign out' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    # Then sign in as them:
    visit '/login'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button 'Log In'

    # Then sign out
    expect(current_path).to eq '/spaces'
    click_link 'Log Out'

    expect(page).not_to have_content "Welcome, Josie"
    # expect(page).to have_content "You have logged out"
  end
end
