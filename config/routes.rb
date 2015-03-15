Rails.application.routes.draw do
  resources :router_statuses

  resources :packages

  resources :notification_lists

  resources :routers

  resources :stores

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
