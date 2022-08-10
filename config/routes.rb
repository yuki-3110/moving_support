Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :homes, only: %i( index )
  resources :users, only: %i( show )
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
