Rails.application.routes.draw do
  resources :insulation_types
  resources :applications
  resources :quotes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
