feature 'Likes' do
  context 'A logged in user' do
    xscenario 'can like a post' do
      sign_up
      create_a_guide
      click_button 'Like'
      expect(page).to have_content '1 Likes'
    end
  end
end
