Rails.application.routes.draw do

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'persons#index'
  devise_for :user#s, path_names: {sign_in: 'login', sign_out: 'logout'} #path: 'admin'
  resources :users do
    resources :cards
    resources :bills
    resources :transactions
  end

  scope '/admin', as: :admin do
    resources :users
    resources :cards
    resources :bills
    resources :transactions
    resources :managers
  end

  post '/bill_info', to: 'bill_info#create'
  #get 'user_root', to: redirect('/users/edit'), as: :user_root
  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'
  get 'new_user' => 'users#new'

  get 'cards' => 'cards#index'
  get 'new_card' => 'cards#new'
  get 'cards' => 'cards#show'

  get 'managers' => 'managers#index'
  get 'bills' => 'bills#index'
  get 'bills' => 'bills#show'
  get 'new_bill' => 'bills#new'
  get 'transactions' => 'transactions#index'
  get 'persons/profile', as: 'user_root'
  #get 'signup' => 'users#new'
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