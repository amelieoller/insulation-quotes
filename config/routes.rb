Rails.application.routes.draw do
  resources :accessories
  root 'welcome#home'
  resources :insulation_types
  resources :applications
  resources :quotes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
