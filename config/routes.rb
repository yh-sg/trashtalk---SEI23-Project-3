Rails.application.routes.draw do
  
  get 'list/index'
  get 'list/show'
  get 'list/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

end
