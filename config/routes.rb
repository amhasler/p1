Rails.application.routes.draw do
  devise_for :users
  resources :works
  root to: "works#index"

end
