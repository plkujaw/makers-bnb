require_relative '../spec_helper.rb'

feature 'page view' do
  scenario 'you can see hello on the page' do
    visit('/')
    expect(page).to have_content "Hello"
  end
end
