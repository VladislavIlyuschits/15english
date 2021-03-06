# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "static_pages#index"
  namespace :admin do
      resources :users
      resources :courses
      resources :subjects
      resources :lessons
      resources :dictionaries
      resources :words
      resources :radio_image_text_questions
      resources :radio_image_questions
      resources :image_questions
      resources :radio_questions
      resources :text_questions
      resources :card_questions
      resources :sub_tests
      resources :test_levels

      root to: "users#index"
      mount PolicyManager::Engine => "/policies"
    end

  get "/:locale" => "static_pages#index"

  scope ":locale", locale: /en|ru/ do
    devise_for :users, skip: :omniauth_callbacks
    resources :users, only: [:show] do
      get "level", on: :collection
    end
    resources :dictionaries, only: [:show]
    resources :subjects
    resources :courses, only: [:index, :show] do
      post "choose_level", on: :member
    end
    resources :lessons do
      get "ending", to: "lessons#ending"
    end
    resources :questions
    resources :cards
    resources :answers, only: [:show, :index, :create, :new]
    resources :radio_questions, only: [:show, :index, :create, :new]
    resources :text_questions
    resources :test_level_sessions
    resources :users do
      get "/map" => "static_pages#map"
    end
    resources :users
    mount PolicyManager::Engine => "/policies"
    post "/answer" => "answers#create", as: :create_answer
  end


  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
