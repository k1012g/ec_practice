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

  	root to: 'top#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
