Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :file_uploads, only: [:new, :create]

  resources :products, except: [:index, :show] do
    get :sales, on: :member
  end
end
