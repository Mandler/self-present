Rails.application.routes.draw do
  devise_for :users
  root to: "presentation#index"

  resources :presentation, only: %w(index show)
  namespace :manage do
    resource :user, only: %w[show update]
  end
end
