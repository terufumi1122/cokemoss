Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins, only: [:index, :create, :update, :destroy]
      get 'set_pins', to: 'pins#set'
    end
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
