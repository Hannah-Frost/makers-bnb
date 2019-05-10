def create_account
  visit '/'
  fill_in(:name, with: "Nandini")
  fill_in(:email, with: "test@gmail.com")
  fill_in(:password, with: "password123")
  click_button 'Create Account'
end

def sign_in_account
  visit '/'
  fill_in(:account_name, with: "Mat")
  fill_in(:account_email, with: "test@gmail.com")
  fill_in(:account_password, with: "password123")
  click_button 'Sign In'
end
