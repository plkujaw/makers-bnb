require_relative '../helpers.rb'

feature 'adding spaces' do

  scenario 'can add a space' do

    register

    visit '/spaces/new'
    fill_in_space

    expect(current_path).to eq '/spaces'
    expect(page).to have_content "bunker"
    expect(page).to have_content "lovely bunker"
    expect(page).to have_content 0.50

  end

end
