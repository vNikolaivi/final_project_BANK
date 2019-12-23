Rails.application.routes.draw do
  resources :cards
  devise_for :users
  resources :users
  resources :persons
  resources :bills
  resources :transactions
  resources :managers
  #root to: 'users#index'


  post '/bill_info', to: 'bill_info#create'
  get "users" => "users#index"
  get "new_user" => "users#new"
  #get 'persons/profile', as: 'user_root'
  get 'signup' => 'users#new'
  get 'sign_in' => 'devise/sessions#new'
  post 'login' => 'sessions#create'
  get 'index', to: 'sessions#index'
  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout' => 'sessions#destroy'

    #resources :users, only: [:new, :create]
  #user_root GET    /persons/profile(.:format)             persons#profile
  #root 'index'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
