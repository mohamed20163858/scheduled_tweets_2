# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'about', to: 'about#index'
  get 'sign_up', to: 'registeration#new'
  post 'sign_up', to: 'registeration#create'
  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  root to: 'main#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
