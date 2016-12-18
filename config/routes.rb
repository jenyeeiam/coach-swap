Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#show'

  get '/how-it-works', to: 'welcome#show'

  resources :coaches, only: [:create, :new, :edit]
  resources :practices, only: [:index]

  resources :coaches do
    get 'my_practices', to: 'coaches#my_practices'
    resources :practices
  end

end
