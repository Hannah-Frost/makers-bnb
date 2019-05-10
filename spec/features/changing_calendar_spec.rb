feature 'calendar dates can be altered' do
  scenario 'user changes the month' do
    create_account
    visit '/property'
    page.select 'March', from: 'month'
    click_button 'Book'
    expect(page).to have_content 'March'
  end
end
