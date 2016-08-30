require 'rails_helper'

feature 'Listview' do
  context 'when instructions are added' do
    xscenario 'displays a list of available instructions' do
      visit root_path
      expect(current_path).to eq '/'
      expect(page).to have_selector('ul')
    end
  end
end
