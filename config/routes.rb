Rails.application.routes.draw do
  devise_for :users

  resources :questions, only: [:index, :create]


  resources :conversations, only: [:index, :show, :new, :create]
  resources :messages, only: [:create]

  root to: 'conversations#index'
end
