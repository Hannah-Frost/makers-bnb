feature 'create account and sign in' do
  scenario 'allows user to create account' do
    visit '/'
    fill_in(:name, with: 'Kiah')
    fill_in(:email, with: 'example@hotmail.co.uk')
    fill_in(:password, with: '123')
    click_button 'Create Account'
    expect(page).to have_content 'Kiah'
  end
end

feature 'sign in' do
  scenario 'able to sign in' do
    visit '/sign_in'
    fill_in(:name, with: "Example Name")
    fill_in(:email, with: "example@gmail.com")
    fill_in(:password, with: "123")
    expect(page).to have_content @name
  end
end
