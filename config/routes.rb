Rails.application.routes.draw do

  devise_for :users
  root "books#index"
  resources :publishers
  resources :authors
  resources :books
  resources :categories
  resources :about
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
