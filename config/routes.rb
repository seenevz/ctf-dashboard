Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#landing"

  get "/login", to: "auth#login", as: "login"
  post "/login", to: "auth#create_session", as: "create_session"
  get "/logout", to: "auth#destroy_session", as: "logout"

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "create_user"

  get "/boards/:id", to: "boards#show", as: "board"
  post "/boards", to: "boards#create"
  
  ## keep this routes at the bottom to avoid mismatches
  get "/:username/info", to: "users#profile", as: "user_profile_info"
  get "/:username/boards", to: "users#profile", as: "user_profile_boards"
  get "/:username/stats", to: "users#profile", as: "user_profile_stats"
  get "/:username/new", to: "users#new_board", as: "new_board"
end
