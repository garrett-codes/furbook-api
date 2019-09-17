Rails.application.routes.default_url_options[:host] = "http://https://furbook-api.herokuapp.com"

Rails.application.routes.draw do
  resources :messages
  resources :friendships
  resources :comments
  resources :posts
  resources :photos, only: [:create, :index]
  resources :pro_pics, only: [:create, :index]
  resources :users
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/login", to: "auth#login"
	post "/signup", to: "users#create"
	get "/profile", to: "users#profile" 
end
