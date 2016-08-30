def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@test.co.uk'
  fill_in 'Password', with: 'Password'
  fill_in 'Password confirmation', with: 'Password'
  click_button 'Sign up'
end
