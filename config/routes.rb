# frozen_string_literal: true

Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :edit_password
      patch :update_password
    end
  end
  get  '/signup', to: 'users#new'

  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
end
