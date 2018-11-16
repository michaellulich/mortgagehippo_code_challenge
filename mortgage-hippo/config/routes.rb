Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/coins/" => "coins#index"
    post "/coins/" => "coins#create"
    get "/coins/:id" => "coins#show"
    patch "/coins/:id" => "coins#update"
    delete "/coins/:id" => "coins#destroy"

    get "/users/" => "users#index"
    post "/users/" => "users#create"
    get "/users/:id" => "users#show"

    get "/transactions/" => "transactions#index"
    post "/transactions/" => "transactions#create"
    get "/transactions/:id" => "transactions#show"

    post "/sessions/" => "sessions#create"
  end 

  

end
