require 'rails_helper'

RSpec.describe 'Chef Show Page' do
    #   As a visitor
    # When I visit a chef's show page
    # I see a link to view a list of all ingredients that this chef uses in their dishes.
    # When I click on that link
    # I'm taken to a chef's ingredients index page
    # and I can see a unique list of names of all the ingredients that this chef uses.

  it 'displays a link to view a list of all ingredients that this chef uses in their dishes' do 
    test_data

    visit "/chef/#{@chef_2.id}"

    within("#chef_ingredients") do
      expect(page).to have_link("Check out our Chef's Ingredients")
    end

    click_link "Check out our Chef's Ingredients"
    
    expect(current_path).to eq("/chef/#{@chef_2.id}/ingredients")
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_5.name)
    expect(page).to have_content(@ingredient_6.name)
    expect(page).to have_content(@ingredient_8.name)
  end
end