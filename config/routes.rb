Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :teas, only: [:index]
      resources :customers, only: [:show] do
        resources :subscriptions, only: [:index, :create, :update]
      end
    end
  end
end
