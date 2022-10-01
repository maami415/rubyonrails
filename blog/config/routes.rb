Rails.application.routes.draw do
  root "articles#index"
  # 1行開ける必要がある
  get "/articles", to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
