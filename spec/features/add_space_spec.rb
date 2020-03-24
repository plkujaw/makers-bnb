feature 'adding spaces' do

  scenario 'can add a space' do

    visit '/spaces'
    fill_in :name, with: "bunker"
    fill_in :description, with: "lovely bunker"
    fill_in :price, with: 0.50
    click_button "Submit"

    expect(page).to have_content "bunker"
    expect(page).to have_content "lovely bunker"
    expect(page).to have_content 0.50

  end

end
