feature 'registration' do
  scenario 'can register as a user' do
    register
    expect(current_path).to eq '/spaces'
    expect(page).to have_content "Welcome Mr Fake Name"
  end

  scenario 'spots a incorrect password confirmation' do
    register_wrong_password
    expect(page).to have_content "Those passwords don't match, please try again"
  end
end
