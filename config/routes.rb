# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top_pages#top'
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]

  resources :diagnoses, only: %i[index show new create destroy] do
    get 'tagged', on: :collection
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
