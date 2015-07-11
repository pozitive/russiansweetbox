Rails.application.routes.draw do

  devise_for :users
  resources :subscriptions, except: :edit
  root 'welcome#index'

end
