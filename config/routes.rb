Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index" #makng the the index our landing page

  #-------
  # Replacing the routers bellow with a resource
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"  #  this is a route to show a single article 

  #--------

  resources :articles
end
