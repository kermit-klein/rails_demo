Rails.application.routes.draw do

  get "/articles/index"

  root controller: :articles, action: :index
  resources :articles, only: [:index, :show, :new]

  post 'articles/new'
  resources :articles, only: [:create]

end
