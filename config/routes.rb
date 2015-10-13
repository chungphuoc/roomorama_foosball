Rails.application.routes.draw do
  root 'homes#index'
  resources :users
end
