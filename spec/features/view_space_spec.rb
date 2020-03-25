feature "shows a space" do
  scenario "can click on a space details and view" do
    register
    click_link('Add a new space')
    fill_in_space
    click_link("bunker")
    expect(current_path).to eq "/spaces/1"
  end
end