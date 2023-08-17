Rails.application.routes.draw do
  get 'somedata/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
end
