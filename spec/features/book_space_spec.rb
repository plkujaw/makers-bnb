feature "books a space" do
  scenario "can request to book a space" do
    register
    click_link('Add a new space')
    fill_in_space
    click_link("bunker")
    click_button "Request to book"
    expect(current_path).to eq "/requests"
  end
end