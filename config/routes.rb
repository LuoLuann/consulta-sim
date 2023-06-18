Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  resources :patients do
    resources :consultations
    member do
      get 'edit_address'
      patch 'update_address'
    end
  end
  resources :doctors do
    get 'consultations', on: :member
  end
end
