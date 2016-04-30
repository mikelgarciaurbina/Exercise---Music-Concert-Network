Rails.application.routes.draw do
  root to: 'concerts#index'

  get '/concerts/most-comments', to: 'concerts#most_comments', as: 'comments_most'

  resources :concerts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end
end