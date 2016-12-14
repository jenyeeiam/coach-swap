Rails.application.routes.draw do

  devise_for :coaches
  root to: 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/how-it-works', to: 'welcome#show'

  resources :coaches, only: [:create, :new, :edit]
  resources :practices, only: [:index]
  resources :sessions

  resources :coaches do
    get 'my_practices', to: 'coaches#my_practices'
    resources :practices
  end

end
