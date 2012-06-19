Ncaa::Application.routes.draw do


  resources :users, :user_sessions, :posts
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
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
