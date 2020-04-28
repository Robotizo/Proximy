 Rails.application.routes.draw do
  root to: 'main#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/sign_in')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :after_signup
  resources :test_users
  resources :event_comments
  resources :group_comments
  resources :comments
  resources :feedbacks
  resources :friend_requests
  resources :notification_events
  resources :locations
  resources :conversations, only: [:new, :create, :show, :index]
  resources :interests
  resources :posts
  resources :users
  resources :event_posts
  resources :group_posts
  resources :groups_relationships, only: [:create, :destroy]
  resources :events_relationships, only: [:create, :destroy]
  resources :interests_relationships, only: [:create, :destroy]
  resources :interests_relationships_to_groups, only: [:create, :destroy]
  resources :interests_relationships_to_events, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resource :session, controller: 'sessions', only: [:create]
    
  resources :friendships do
    patch :update_friendship, on: :member
  end

  resources :notifications do
    patch :update_notif, on: :member
  end 

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

  # custom auth routes
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/sign_in' => 'sessions#new', :as => nil
  delete '/logout', to: 'sessions#destroy'

  get 'main/test'
  get 'main/privacy'
  get 'main/terms'
  get 'chats', :to => 'chats#index'
  get '/contacts', to: 'contacts#index'
  get '/notifications', to: 'notifications#index'

  get 'chats/list_messages/:id', :to => 'chats#list_messages'
  get 'chats/ajax_messages', :to => 'chats#ajax_messages'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end










