Rails.application.routes.draw do

   root "sessions#new"

     resources :projects do
    member do
      get 'add_user'
      get 'remove_user'
      patch 'add_user'
      patch 'remove_user'
    end
  end



  resources :bugs do
    member do
      patch 'assign'
      patch 'start_working'
      patch 'work_done'
    end
  end

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'
   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   get '/welcome', to: 'sessions#welcome'
   #get '/authorized', to: 'sessions#page_requires_login'
   delete '/logout', to: 'sessions#destroy'
   #get '/projects', to: 'projects#index'
   #get '/projects/new', to: 'projects#new'
   #get '/projects/create' to: 'projects#new'
   #post '/projects/create' to: 'projects#create'
     # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
