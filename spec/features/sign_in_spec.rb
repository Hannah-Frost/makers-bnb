feature 'create account' do
  scenario 'allows user to create account' do
    visit '/'
    fill_in(:name, with: 'Kiah')
    fill_in(:email, with: 'example@gmail.com')
    fill_in(:password, with: '123')
    click_button 'Create Account'
    expect(page).to have_content 'Kiah'
  end
end

feature 'sign in' do
  scenario 'user can sign in with a matching account' do
    User.add(name: 'Kiah', email: 'example@gmail.com', password: '123')

    visit '/'
    fill_in(:account_name, with: "Kiah")
    fill_in(:account_email, with: "example@gmail.com")
    fill_in(:account_password, with: "123")
    click_button 'Sign In'
    expect(page).to have_content 'Kiah'
  end
end
