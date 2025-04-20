# frozen_string_literal: true

Rails.application.routes.draw do
  resources :searches, only: %i[new create show] do
    collection do
      get :categories
      get :text
      get :category
      get :random
    end
  end

  # Root path points to the search index
  root 'searches#new'

  # Route to change language
  get '/change_locale/:locale', to: 'application#change_locale', as: :change_locale
end
