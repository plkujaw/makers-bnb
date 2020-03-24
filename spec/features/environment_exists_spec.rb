require_relative '../spec_helper.rb'
require_relative '../helpers.rb'

feature 'page view' do
  scenario 'you can see hello on the page' do
    register
    expect(page).to have_content "Welcome Mr Fake Name"
  end
end
