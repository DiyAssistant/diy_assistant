feature 'Search for instructions' do
  scenario 'A user can search for instructions' do
    sign_up
    create_a_guide
    visit '/'
    fill_in 'Search', with: 'desk'
    click_button 'Search'
    expect(current_url[current_host.size..-1]).to eq '/search?q=desk'
    expect(page).to have_content 'How to build a desk'
  end
end
