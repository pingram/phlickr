Phlickr::Application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    get "users/profile", to: "users#profile"
    resources :users, only: [:show]
    resources :photos, except: [:new, :edit]
  end
end