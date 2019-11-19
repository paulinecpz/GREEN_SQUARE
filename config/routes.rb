Rails.application.routes.draw do
  devise_for :users
  root to: 'gardens#index'

  resources :gardens do
    resources :bookings, only: [:create, :new, :show, :index] do
      resources :reviews, only: [:create, :new]
    end
  end
  patch 'gardens/:id', to: 'gardens#update', as: :gardens_update

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
