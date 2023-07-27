Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get '/blogs', to: 'blog_posts#index'

  # resources :blog_posts do

  #   post 'like', on: :member
  #   post 'dislike', on: :member

  # end

  # root to: 'blog_posts#index'
  # get 'blog_post/view/:id', to: 'blog_posts#show'

  # userblog app welcome is root
  root 'userblogs#welcome'

  get 'userblogs/:id', to: 'userblogs#index'
  get 'userblog/new', to: 'userblogs#new'
  post 'userblog/create', to: 'userblogs#create'
  get 'userblog/view/:id', to: 'userblogs#view'

  # resources :userblogs do 
  #   post 'like', on: :member
  #   post 'dislike', on: :member
  # end

  post 'userblog/like/:id', to: 'userblogs#like'
  post 'userblog/dislike/:id', to: 'userblogs#dislike'


  # sign up form route
  get 'userblog/sign_up', to: 'userblogs#sign_up' 
  post 'userblog/sign_up', to: 'userblogs#createUser'

  # login form route 
  get 'userblog/login', to: 'userblogs#login'

  post 'userblog/checkuser', to: 'userblogs#checkuser'

end
