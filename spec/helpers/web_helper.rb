def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@test.co.uk'
  fill_in 'Password', with: 'Password'
  fill_in 'Password confirmation', with: 'Password'
  click_button 'Sign up'
end

def create_a_guide(title: 'How to build a desk',
                    description: 'making my own desk')
  visit '/'
  click_link "Create guide"
  fill_in "Title" , with: title
  fill_in "Description", with: description
  click_button 'Publish'
end
