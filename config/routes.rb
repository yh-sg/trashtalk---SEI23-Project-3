
Rails.application.routes.draw do
  devise_for :users
  
  resources :lists # /list/index 

  # for fufillment
  patch "/list/:id/assign", to: "lists#assign", as: :assign_list
  patch "/list/:id/complete", to: "lists#complete", as: :complete_list


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

end
