Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists do
      resources :items, only: [:index, :create, :update, :destroy]
    end

    resources :items, only: [:index, :destroy]
  end
end
