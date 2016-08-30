require 'rails_helper'

feature 'Listview' do
  context 'when instructions are added' do
    scenario 'displays a list of available instructions' do
      # instructions1 = double('instructions')
      # instructions2 = double('instructions')
      visit root_path
      expect(current_path).to eq '/'
      expect(page).to have_selector('ul')
      # expect(list).not_to be_empty
    end
  end
end
# visit root_path
