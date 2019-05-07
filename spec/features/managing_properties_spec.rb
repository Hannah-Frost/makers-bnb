feature 'changes the properties listed' do
  scenario 'listed properties are displayed' do
    visit '/listings'
    expect(page).to have_content "[]"
  end
  # scenario 'a user can add a property' do
  #   visit '/listings'
  #   click_button 'Add Listing'
  # end
end
