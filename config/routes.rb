Rails.application.routes.draw do
    
    resources :greenhouses
    resources :plants
    resources :plots
    resources :towers
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get "/towers", to: "towers#index"
    get "/towerplots", to: "towers#plots"
    patch "/plots/:plot_id/water", to: "plots#water"
    patch "/plots/:plot_id/sample", to: "plots#sample"
    
    # get "/towers/:id", to: "towers#show"

    # put "/towers", to: "towers#create"
    # destroy "/towers/:id", to: "towers#destroy"

    # Defines the root path route ("/")
    # root "articles#index"
  
end
