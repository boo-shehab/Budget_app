# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  authenticated :user do
    root 'categories#index', as: :root #-> if user is logged in
    # resources :user, only: [:edit, :update, :show, :destory] #-> ONLY available for logged in users
  end

  unauthenticated :user do
    root 'splash_screen#home', as: :unauthenticated #-> if user is not logged in
  end
end
