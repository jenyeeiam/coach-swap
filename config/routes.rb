Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/how-it-works', to: 'welcome#show'

  resources :coaches
  resources :practices, only: [:index]
  resources :sessions

  resources :coaches do
    resources :practices
  end

  # namespace :coaches do
  #   resources :practices
  # end
end
