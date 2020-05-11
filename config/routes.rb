Rails.application.routes.draw do

  namespace :api do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    
    post "/sessions" => "sessions#create"

    get "/posts" => "posts#index"
    post "/posts" => "posts#create"
    get "/posts/:id" => "posts#show"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    get "/comments" => "comments#index"
    post "/comments" => "comments#create"
    delete "/comments/:id" => "comments#destroy"

    get "/likes" => "likes#index"
    post "/likes" => "likes#create"
    delete "/likes/:id" => "likes#destroy"

  end
end
