feature 'properties listed' do
  scenario 'properties page recognises property instance' do
    visit '/properties'
    expect(page).to have_content @property
  end

  scenario 'property has a name' do
    visit '/properties'
    expect(page).to have_content 'example_name'
  end
  

  # scenario 'a user can add a property' do
  #   visit '/listings'
  #   click_button 'Add Listing'
  # end
end
