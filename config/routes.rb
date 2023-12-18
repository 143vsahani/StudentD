Rails.application.routes.draw do
  devise_for :users
  root 'wellcomes#index'

  resources :schools do
    resources :classes
  end
end
