require_relative '../spec_helper.rb'

feature 'page view' do
  scenario 'you can see hello on the page' do
    visit('/')
    fill_in :name, with: "Mr Fake Name"
    fill_in :email, with: "fakeaddress@gmail.com"
    fill_in :password, with: "badpassword"
    fill_in :password_confirmation, with: "badpassword"
    click_button "Submit"
    expect(page).to have_content "Welcome Mr Fake Name"
  end
end
