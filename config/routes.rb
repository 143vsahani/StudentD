Rails.application.routes.draw do
  devise_for :users
  root 'wellcomes#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :students do
    collection do
      get 'show_class'
      get 'show_school'
      get 'show_teacher'
    end
  end
  resources :teachers
  # Defines the root path route ("/")
  # root "posts#index"
  resources :schools do
    resources :sclasses do
      resource :assignments, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :teachers
    end
  end
  get 'downloads/assignment/:id', to: 'downloads#assignment', as: 'download_assignment'
end
