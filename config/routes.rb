Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :auctions, only: [:new, :create, :show]do
  	resources :publishings, only: :create
  	resources :bids, only: [:create, :destroy, :update]
  end



end
