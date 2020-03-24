feature 'registration' do
  scenario 'can register as a user' do
    register
    expect(current_path).to eq '/spaces'
    expect(page).to have_content "Welcome Mr Fake Name"
  end
end
