Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants, only: [:new, :show, :index, :create]
  resources :reviews, only: [:new, :create, :show]


  resources :restaurants do
    resources :reviews
  end
end
