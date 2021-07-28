Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index" #makng the the index our landing page

  #-------
  # Replacing the routers bellow with a resource
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"  #  this is a route to show a single article 

  #--------
  # resources :articles
  # update the above resource to fit into the realtionship heiracy between it and the comments 
  resources :articles do
    resources :comments
  end
end
