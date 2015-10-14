Rails.application.routes.draw do
  root 'homes#index'
  resources :users do
    post :list_user, on: :collection
  end
  resources :matches do
    put :update_result, on: :member
  end
end
