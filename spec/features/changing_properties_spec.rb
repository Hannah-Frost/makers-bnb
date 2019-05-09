feature 'properties can be altered' do
  scenario 'property has a name' do
    create_account
    visit '/add'
    fill_in(:name, with: "One Big House")
    click_button 'Add Listing!'
    expect(page).to have_content 'One Big House'
  end

  scenario 'property has a description' do
    create_account
    visit '/add'
    fill_in(:description, with: "Its large")
    click_button 'Add Listing!'
    expect(page).to have_content 'Its large'
  end

  scenario 'property has a price' do
    create_account
    visit '/add'
    fill_in(:price, with: "1000")
    click_button 'Add Listing!'
    expect(page).to have_content '1000'
  end

  scenario 'property is displayed' do
    create_account
    visit '/add'
    fill_in(:name, with: "House")
    click_button 'Add Listing!'
    expect(page).to have_content 'House'
  end
end
