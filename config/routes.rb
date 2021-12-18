Rails.application.routes.draw do
  devise_for :users
  resources :parts
  resources :products
  resources :technologies
  resources :vendors
  resources :departments
  resources :factories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "factories#index"
end
