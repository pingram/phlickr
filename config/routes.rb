Phlickr::Application.routes.draw do
  root to: "static_pages#root"

  get "users/profile", to: "users#profile"
  
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    resources :photos, except: [:new, :edit]
  end
end