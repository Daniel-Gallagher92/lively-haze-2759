def test_data
  @chef_1 = Chef.create!(name: "Matty Matheson")
  @chef_2 = Chef.create!(name: "Carmy Berzatto")

  #chef 1 dishes
  @dish_1 = Dish.create!(name: "Poutine", description: "Hello heart attack!", chef_id: @chef_1.id)
  @dish_2 = Dish.create!(name: "Steak", description: "It's what's for dinner!", chef_id: @chef_1.id)

  #chef 2 dishes
  @dish_4 = Dish.create!(name: "Fried Rice", description: "You'll be hungry again soon!", chef_id: @chef_2.id)
  @dish_5 = Dish.create!(name: "Spinach Ravioli", description: "Mama Mia!", chef_id: @chef_2.id)
  @dish_6 = Dish.create!(name: "Country Pie", description: "Almost as good as the song!", chef_id: @chef_2.id)

  #poutine
  @ingredient_1 = Ingredient.create!(name: "Cheese Curds", calories: 600)
  @ingredient_3 = Ingredient.create!(name: "Gravy", calories: 300)

  #ny strip w/ butter
  @ingredient_2 = Ingredient.create!(name: "NY Strip", calories: 500)

  #fried rice
  @ingredient_4 = Ingredient.create!(name: "Rice", calories: 200)
  @ingredient_5 = Ingredient.create!(name: "Soy Sauce", calories: 50)
  @ingredient_6 = Ingredient.create!(name: "Egg", calories: 100)

  #spinach ravioli
  @ingredient_7 = Ingredient.create!(name: "Flour", calories: 50)
  @ingredient_8 = Ingredient.create!(name: "Spinach", calories: 100)
  @ingredient_9 = Ingredient.create!(name: "Ricotta", calories: 200)

  #country pie
  @ingredient_10 = Ingredient.create!(name: "Butter", calories: 300)
  @ingredient_11 = Ingredient.create!(name: "Berries", calories: 50)

  #Poutine
  @dish_ingredients_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
  @dish_ingredients_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

  #steak
  @dish_ingredients_2 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id)
  @dish_ingredients_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_10.id)

  #fried rice
  @dish_ingredients_5 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_4.id)
  @dish_ingredients_6 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_5.id)
  @dish_ingredients_7 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_6.id)
  @dish_ingredients_12 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_8.id)

  #country pie
  @dish_ingredients_8 = DishIngredient.create!(dish_id: @dish_6.id, ingredient_id: @ingredient_10.id)
  @dish_ingredients_9 = DishIngredient.create!(dish_id: @dish_6.id, ingredient_id: @ingredient_11.id)


  #spinach ravioli
  @dish_ingredients_10 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_7.id)
  @dish_ingredients_11 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_8.id)
  @dish_ingredients_11 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_9.id)
end



# This file is copied to spec/ when you run 'rails generate rspec:install'
require "simplecov"
SimpleCov.start

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
