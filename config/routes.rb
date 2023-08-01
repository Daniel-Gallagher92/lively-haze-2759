Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/chef/:id/ingredients", to: "chefs#index"

  get "/chef/:id", to: "chefs#show"

  get "/dishes/:id", to: "dishes#show"

  post "/dishes/:id/ingredients", to: "dish_ingredients#create"

end
