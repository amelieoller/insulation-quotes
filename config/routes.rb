Rails.application.routes.draw do
  root 'welcome#home'
  resources :insulation_types
  resources :applications
  resources :quotes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
