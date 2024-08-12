Rails.application.routes.draw do
  devise_for :users
  root "tasks#show"

  resources :tasks, only: [:new, :create, :show]

  # Profile path
  get "profile" => "profile#show"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end