Rails.application.routes.draw do
  	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	resources :users, only: [:index, :show, :edit, :update, :destroy] do
		resource :relationships, only: [:create, :destroy]
		get :follows, on: :member
	    get :followers, on: :member
	end

	resources :items

	post '/buy/:id/' => 'items#buy', as: 'buy_item'

	post '/item/favorite/:item_id/' => 'favorites#create', as: 'create_favorite'
	delete '/item/favorite/:item_id/' => 'favorites#destroy', as: 'destroy_favorite'

  	root to: 'top#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
