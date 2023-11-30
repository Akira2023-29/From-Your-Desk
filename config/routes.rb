# frozen_string_literal: true

Rails.application.routes.draw do
  get 'top_pages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'top_pages#top'
end
