Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :delivery_details
  end
  resources :profiles
  resources :addresses

  root "products#index"
end
