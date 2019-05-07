feature 'properties listed' do
  scenario 'properties page recognises property instance' do
    visit '/properties'
    expect(page).to have_content @property
  end
  scenario 'property has a name' do
    visit '/add'
    fill_in(:name, with: "One Big House")
    click_button 'Add Listing!'
    expect(page).to have_content 'One Big House'
  end
  scenario 'property has a description' do
    visit '/add'
    fill_in(:description, with: "Its large")
    click_button 'Add Listing!'
    expect(page).to have_content 'Its large'
  end
  scenario 'property has a price' do
    visit '/add'
    fill_in(:price, with: "1000")
    click_button 'Add Listing!'
    expect(page).to have_content '1000'
  end
end
