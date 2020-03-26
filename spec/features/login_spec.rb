feature 'log in and log out' do
  scenario 'Can press the log in button' do
    register
    click_link "Log Out"
    click_link "Log in"
    expect(current_path).to eq "/login"
    fill_in :email, with: "fakeaddress@gmail.com"
    fill_in :password, with: "badpassword"
    click_button "Log In"
    expect(current_path).to eq "/spaces"
    expect(page).to have_content "Welcome Mr Fake Name"
  end
end