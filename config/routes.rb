Rails.application.routes.draw do
  devise_for :users, path_names: {
	  sign_up: ''
	}
  resources :works
  resources :media_objects
  resources :resource_objects
  root to: "works#index"

end
