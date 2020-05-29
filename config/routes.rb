 Rails.application.routes.draw do


  get 'auth/:provider/callback', to: 'sessions#create'


  get 'auth/failure', to: redirect('/sign_in')
  delete 'signout', to: 'sessions#destroy', as: 'signout'



  resources :after_signup




  resources :test_users
  get 'chats', :to => 'chats#index'

  resources :event_comments
  resources :group_comments
  resources :comments
  resources :feedbacks
  resources :friend_requests


  resources :friendships do 
    patch :update_friendship, on: :member
  end


  get '/contacts', to: 'contacts#index'

  get '/notifications', to: 'notifications#index'


  resources :notifications do 
    patch :update_notif, on: :member
  end 

  

  resources :notification_events
  resources :locations
  resources :conversations, only: [:new, :create, :show, :index]



  resources :interests
  resources :event_posts
  resources :group_posts
  resources :groups_relationships, only: [:create, :destroy]
  resources :events_relationships, only: [:create, :destroy]
  resources :interests_relationships, only: [:create, :destroy]
  resources :interests_relationships_to_groups, only: [:create, :destroy]
  resources :interests_relationships_to_events, only: [:create, :destroy]


  resources :events do
    collection do 
      get :myevents
    end

    member do 
      get :interests
    end 
  end






  resources :groups do 
    collection do 
      get :mygroups
    end

    member do 
      get :interests
    end 
  end


  resources :posts



  get 'main/test'

  get 'privacy', :to => 'main#privacy'
  get 'terms', :to => 'main#terms'
  get 'dmca', :to => 'main#dmca'
  get 'guidelines', :to => 'main#guidelines'
  get 'faq', :to => 'main#faq'




  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users do
    collection do 
      get :discover
    end
    
    member do
      get :following, :followers
      get :interests
      get :interestsMenu
      get :location
      get :avatar
      patch :save_avatar
      get :confirm_email

    end
  end

  resources :relationships, only: [:create, :destroy]

    resource :session,
      controller: 'sessions',
      only: [:create]


get '/sign_in' => 'sessions#new', :as => nil




  root to: 'main#index'

 

  resources :users

  mount ActionCable.server => '/cable'


  
  get 'chats/list_messages/:id', :to => 'chats#list_messages'
  get 'chats/ajax_messages', :to => 'chats#ajax_messages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end










