# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'top_pages#top'

  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/terms_and_use', to: 'static_pages#terms_and_use'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :favorites, only: %i[create destroy]
  resources :bookmarks, only: %i[create destroy]

  resources :diagnoses, only: %i[index show new destroy] do
    post 'diagnosis', on: :collection
    get 'favorites', on: :collection
  end

  resources :items, only: %i[index show new create destroy]


  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
