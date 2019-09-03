Rails.application.routes.draw do
  resources :posts
  resources :photos
  resources :pro_pics
  resources :users
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/login", to: "auth#login"
	post "/signup", to: "users#create"
	get "/profile", to: "users#profile" 
end
