feature 'instructions' do
  scenario 'is able to post instructions' do
    sign_up
    click_link 'Create guide'
    fill_in 'Title', with: 'How to build a desk'
    fill_in 'Description', with: 'making my own desk'
    click_button 'Publish'

    expect(page).to have_content 'making my own desk'
    expect(current_path).to eq '/instructions/1'
  end

  scenario 'is able to upload a pic with the instructions post' do
    sign_up
    click_link 'Create guide'
    fill_in 'Title', with: 'How to build a desk'
    fill_in 'Description', with: 'making my own desk'
    page.attach_file('instruction_image', Rails.root + 'spec/features/test_image/BK_Logo.jpg')
    click_button 'Publish'

    expect(page).to have_css("img")
    expect(current_path).to eq '/instructions/2'
  end
end
