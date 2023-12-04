# frozen_string_literal: true

Rails.application.routes.draw do

  root 'top_pages#top'
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]

  # 診断ページ
  resources :diagnoses, only: %i[new]

  resources :boards, only: %i[index show destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
