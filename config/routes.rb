Rails.application.routes.draw do
  get 'pages', to: "pages#index"
  post 'auth', to: 'sessions#create'
  post 'registration', to: 'sessions#registration'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
