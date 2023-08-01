require 'rails_helper'

RSpec.describe 'Dish Show Page' do
#   As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.

  describe 'US_1' do 
    it 'shows the dish name and description' do
      test_data

      visit "/dishes/#{@dish_1.id}"
      
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to_not have_content(@dish_2.name)
      expect(page).to have_content(@dish_1.chef.name)
    end

    it 'I see a list of ingredients for that dish' do 
      test_data

      visit "/dishes/#{@dish_1.id}"
      
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to_not have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
    end
  end

  describe 'US_2' do
    # As a visitor
    # When I visit a dish's show page
    # I see a form to add an existing Ingredient to that Dish
    # When I fill in the form with the ID of an Ingredient that exists in the database
    # And I click Submit
    # Then I am redirected to that dish's show page
    # And I see that ingredient is now listed. 
  
      it 'has a form to add an existing ingredient to that dish' do
        test_data
  
        visit "/dishes/#{@dish_6.id}"
        
        within("#add_ingredient") do
          expect(page).to have_content("Add an ingredient to this dish:")
          expect(page).to have_button("Add an Ingredient")
        end

        fill_in :ingredient_id, with: @ingredient_7.id
        click_button "Add an Ingredient"

        expect(current_path).to eq("/dishes/#{@dish_6.id}")
        expect(page).to have_content(@ingredient_7.name)
      end
    end
end