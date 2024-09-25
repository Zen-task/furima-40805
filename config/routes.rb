Rails.application.routes.draw do
  devise_for :users
   root 'items#index'
   resources :items, [:new, :create, :index, :show, :edit, :updat, :destroy]

end
