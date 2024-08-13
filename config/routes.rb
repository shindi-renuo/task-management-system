Rails.application.routes.draw do
  devise_for :users do
    get ":user/update" => "devise/registrations#edit", as: :update_user
  end

  root "tasks#show"
  delete "tasks/:id" => "tasks#remove" 

  resources :tasks, only: [:new, :create, :show] do
    member do
      patch :mark_as_completed
      patch :mark_as_pending
    end
  end

  # Profile path
  get "user/profile" => "profile#show", as: :user_profile

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end