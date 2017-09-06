Rails.application.routes.draw do
  resources :items
  resources :users
  namespace :api, defaults: { format: :json } do
    resources :users
  end
end
