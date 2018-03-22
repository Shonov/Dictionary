Rails.application.routes.draw do ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :words 
  root 'words#index'

  controller :users do 
  	get '/sign_up' => :sign_up
  	post '/sign_up' => :create
  	get '/sign_in' => :sign_in
  	post '/sign_in' => :login
  end

get 'login' => 'user_sessions#new'
get 'logout' => 'user_sessions#destroy'

end