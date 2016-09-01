feature 'category' do
  context 'when user posts instructions' do
    scenario "user can assign a predefined category when posts he's instructions" do
      sign_up
      click_link "Create guide"
      fill_in "Title" , with: "How to build a desk"
      fill_in "Description", with: "making my own desk"
      select 'Technology', from: 'instruction_category_id'
      click_button 'Publish'
      expect(page).to have_content "making my own desk"
      expect(page).to have_content "Category: Technology"
      expect(current_path).to eq "/instructions/1"
    end
  end
  context 'when the user visits the site' do
    scenario 'it should show a list of links for categories' do
      visit '/'
      expect(page).to have_selector('ul li', count: 8)
      categories = ['Technology', 'Workshop', 'Craft', 'Home', 'Food', 'Play', 'Outside', 'Costumes']
        categories.each do |category|
          expect(page).to have_link category
        end
    end

    scenario 'it should show a list of instructions avaiable for that category' do
      sign_up
      create_a_guide(title: 'Make a macbook')
      visit '/'
      click_link 'Technology'
      expect(current_path).to eq '/category/technology'
      expect(page).to have_content 'Make a macbook'
    end
  end
end
