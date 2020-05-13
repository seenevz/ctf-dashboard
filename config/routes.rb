Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#landing"

  get "/login", to: "auth#login", as: "login"
  post "/login", to: "auth#create_session", as: "create_session"
  get "/logout", to: "auth#destroy_session", as: "logout"

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "create_user"

  ## Board
  get "/b/:id", to: "boards#show", as: "board"

  ## keep this routes at the bottom to avoid mismatches
  get "/u/:username", to: "users#profile", as: "profile_info"
  get "/u/:username/my-boards", to: "users#profile", as: "profile_boards"
  get "/u/:username/stats", to: "users#profile", as: "profile_stats"
end
