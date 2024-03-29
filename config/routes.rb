# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cooking_steps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :recipes do
        resources :ingredients
        resources :nutritional_labels
        resources :cooking_steps
      end
    end
  end
end
