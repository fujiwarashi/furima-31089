Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  devise_for :users
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :order, only: :create do
      resources :addless, only: :create
    end 
  end
end
