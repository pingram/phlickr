Phlickr::Application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :photos, only: :create

  namespace :api do
    resources :photos, only: [:new]
  end

  namespace :api, defaults: { format: :json } do
    get "users/profile", to: "users#profile"
    # get "photos/explore", to: "photos#explore"
    get "photos/explore/:page_num", to: "photos#explore"
    get "photos/favorites", to: "photos#favorites"
    get "photos/change_favorite", to: "photos#change_favorite"
    resources :users, only: [:show]
    resources :users, only: [] do
      resources :photos, only: [:index]
    end
    resources :photos, except: [:new, :edit, :index]
    resources :albums, except: [:new, :edit]
  end
end