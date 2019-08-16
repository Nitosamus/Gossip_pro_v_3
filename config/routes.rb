Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do
  	resources :comments
  end
  resources :cities
  
  resources :gossips do 
  		resources :likes
  end
  resources :users
  resources :sessions
end
	