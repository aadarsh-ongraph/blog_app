Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get '/blogs', to: 'blog_posts#index'

  resources :blog_posts do

    post 'like', on: :member
    post 'dislike', on: :member

  end

  root to: 'blog_posts#index'
  get 'blog_post/view/:id', to: 'blog_posts#show'

  get 'userblogs', to: 'userblogs#index'

  get 'userblog/new', to: 'userblogs#new'
  post 'userblog/create', to: 'userblogs#create'

  get 'userblog/view/:id', to: 'userblogs#view'
end
