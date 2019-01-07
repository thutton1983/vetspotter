Rails.application.routes.draw do
  resources :veterinarians
  get 'pages/about'
  get 'pages/contact'
  root "veterinarians#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
