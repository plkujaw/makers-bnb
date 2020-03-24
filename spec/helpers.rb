def fill_in_space
  fill_in :name, with: "bunker"
  fill_in :description, with: "lovely bunker"
  fill_in :street_address, with: "1234 doom street"
  fill_in :country, with: "Neverland"
  fill_in :city, with: "Doomsville"
  fill_in :postcode, with: "XX UDED"
  fill_in :price, with: 0.50
  click_button "Submit"
end
