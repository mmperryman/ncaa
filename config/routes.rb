Ncaa::Application.routes.draw do


  resources :users, :user_sessions, :posts
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'forgot_password' => 'user_sessions#forgot_password', :as => :forgot_password, :via => :get
  match 'forgot_password' => 'user_sessions#forgot_password_lookup_email', :as => :forgot_password, :via => :post
  put 'reset_password/:reset_password_code' => 'users#reset_password_submit', :as => :reset_password, :via => :put
  get 'reset_password/:reset_password_code' => 'users#reset_password', :as => :reset_password, :via => :get  
  
  match "/hof" => "home#hof"
  
  root :to => "home#index"
  resources :picks, :only => [:index, :create, :update, :destroy] do
    collection do
      get 'update_picks'
    end
  end
  
  resources :standings, :only => :index
  resources :teams do
    member do 
      get 'win'
      get 'loss'
    end  
  end
  get "home/index", :controller => 'home'
end
