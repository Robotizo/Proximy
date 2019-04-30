Rails.application.routes.draw do



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
  resources :events
  resources :groups


  resources :posts



  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  root 'main#index'

 

  resources :users



  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
