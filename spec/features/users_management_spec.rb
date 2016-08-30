

feature "User" do
  scenario "User is able to sign up" do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@test.co.uk'
    fill_in 'Password', with: 'Password'
    fill_in 'Password confirmation', with: 'Password'
    click_button 'Sign up'
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario "User is able to log in" do
    sign_up
    click_link 'Sign out'
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.co.uk'
    fill_in 'Password', with: 'Password'
    click_button 'Log in'
    expect(current_path).to eq('/')
    expect(page).to have_content('Signed in successfully.')
  end
  scenario "User is able to sign out" do
    sign_up
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end
end
