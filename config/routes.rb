Ncaa::Application.routes.draw do
  get "home/index"

  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  
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
  match "/hof" => "home#hof"
end
