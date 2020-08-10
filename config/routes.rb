
Rails.application.routes.draw do
  get 'intro/index'
  get 'intro/show'
  devise_for :users
  
  resources :lists # /list/index 
  get "users/:id/index", to: "users#index", as: :home #user/index => page that shows all lists
  get "users/:id", to: "users#show", as: :user # user/show
  
  # for fufillment
  patch "/list/:id/assign", to: "lists#assign", as: :assign_list
  patch "/list/:id/complete", to: "lists#complete", as: :complete_list

  root 'intro#index'

end
