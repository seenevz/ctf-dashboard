Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#landing'

  get '/login', to: "auth#login", as: 'login'
  post '/login', to: "auth#create_session", as: 'create_session'
  get '/logout', to: "auth#destroy_session", as: 'logout'

  get '/profile', to: 'users#profile', as: 'user_profile'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create_user'
end
