Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'homes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :homes, only: %i( index )
  resources :users, only: %i( show )
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks do
    resources :memos
    member do
      get :move_higher
      get :move_lower
    end
  end

  post '/tasks/:id/toggle' => 'tasks#toggle'

  resources :movings 


end
