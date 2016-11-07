Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :coaches
  resources :practices

  resources :coaches do
    resources :practices
  end
end
