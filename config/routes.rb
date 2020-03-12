# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get  '/signup', to: 'users#new'

  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
end
