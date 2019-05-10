feature 'calendar dates can be altered' do
  scenario 'user changes the month' do
    create_account
    visit '/property'
    page.select 'March', from: 'month'
    click_button 'Book'
    expect(page).to have_content 'March'
  end

  scenario 'allows booking if the date is not booked' do
    visit '/property'
    page.select 'March', from: 'month'
    click_button 'Book'
    expect(page).to have_content 'These dates are available.'
  end
end
