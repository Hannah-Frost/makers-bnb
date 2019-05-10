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
    User.add(name: 'Mat', email: 'test@gmail.com', password: '123')

    visit '/'
    sign_in_account
    expect(page).to have_content 'Mat'
  end
end

feature 'sign out' do
  scenario 'user can sign out of an account' do
    User.add(name: 'Mat', email: 'test@gmail.com', password: '123')

    visit '/'
    sign_in_account
    click_button 'Sign Out'
    expect(page).to have_content "Sign in"
  end
end
