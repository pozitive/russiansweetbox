Rails.application.routes.draw do

  devise_for :users
  resources :subscriptions, only: [:show, :new, :create]
  root 'welcome#index'

end
