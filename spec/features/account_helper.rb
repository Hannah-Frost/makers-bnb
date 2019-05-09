def create_account
  visit '/'
  fill_in(:name, with: "Nandini")
  fill_in(:email, with: "test@gmail.com")
  fill_in(:password, with: "password123")
  click_button 'Create Account'
end
