Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists do
      resources :items, only: [:create, :update]
    end

    resources :items, only: [:destroy, :update]
  end
end
