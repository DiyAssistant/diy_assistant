Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users

  resources :likes
  resources :instructions
  resources :searches, :path => '/search'
  resources :categories, :path => '/category'

end
