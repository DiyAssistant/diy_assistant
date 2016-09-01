feature 'Search result pagination' do
  before do
    i = 0
    1..10.times do
      i += 1
      Instruction.create(title: "example instruction #{i}", description: 'test etc..')
    end
  end

  scenario 'A user can paginate through a list of search results' do
    visit '/'
    fill_in 'Search', with: 'example'
    click_button 'Search'
    click_link 'Next →'
    expect(current_url[current_host.size..-1]).to eq '/search?page=2&q=example'
  end
end
