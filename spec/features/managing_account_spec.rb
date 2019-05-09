feature 'creating an account and signing in' do
  scenario 'allows user to create account' do
    visit '/'
    fill_in(:name, with: 'Kiah')
    fill_in(:email, with: 'example@hotmail.co.uk')
    fill_in(:password, with: '123')
    click_button 'Create Account'
    expect(page).to have_content 'Kiah'
  end
end
