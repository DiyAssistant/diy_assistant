
feature "instructions" do
  scenario "is able to post instructions" do
    sign_up
    click_link "Create guide"
    fill_in "Title" , with: "How to build a desk"
    fill_in "Description", with: "making my own desk"
    select 'Technology', from: 'instruction_category_id'
    click_button 'Publish'

    expect(page).to have_content "making my own desk"
    expect(current_path).to eq "/instructions/2"
  end
end
