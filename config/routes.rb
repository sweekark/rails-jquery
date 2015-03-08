Rails.application.routes.draw do
  resources :packages

  resources :notification_lists

  resources :routers

  resources :stores

  resources :countries

  resources :students

  resources :payments

  resources :merchants

  resources :bills

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
