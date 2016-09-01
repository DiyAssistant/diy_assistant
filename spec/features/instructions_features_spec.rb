feature 'instructions' do
  scenario 'is able to post instructions' do
    sign_up
    click_link 'Create guide'
    fill_in 'Title', with: 'How to build a desk'
    fill_in 'Description', with: 'making my own desk'
    select 'Technology', from: 'instruction_category_id'
    click_button 'Publish'

    expect(page).to have_content 'making my own desk'
    expect(current_path).to eq '/instructions/how-to-build-a-desk'
  end

  scenario 'is able to upload a pic with the instructions post' do
    sign_up
    click_link 'Create guide'
    fill_in 'Title', with: 'How to build a desk'
    fill_in 'Description', with: 'making my own desk'
    select 'Technology', from: 'instruction_category_id'
    page.attach_file('instruction_image', Rails.root + 'spec/features/test_image/BK_Logo.jpg')
    click_button 'Publish'

    expect(page).to have_css('img')
    expect(current_path).to eq '/instructions/how-to-build-a-desk'
  end

  scenario "user can't add instructions with a duplicated name" do
    sign_up
    create_a_guide
    create_a_guide

    expect(page).to have_content 'Title has already been taken'
    expect(current_path).to eq '/instructions'
  end
end
