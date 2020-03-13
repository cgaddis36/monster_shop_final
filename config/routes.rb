Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :root, to: 'welcome#index'
  get '/', to: 'welcome#index'

  get '/merchants', to: 'merchants#index'
  post '/merchants', to: 'merchants#create'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id', to: 'merchants#show'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:merchant_id/items', to: 'items#index'
  get '/merchant/items/:id/change_status', to: 'merchants#show'
  delete '/merchant/items/:id/change_status', to: 'merchants#destroy'

  post '/items/:item_id/reviews', to: 'reviews#create', as: 'item_reviews'
  get '/items/:item_id/reviews/new', to: 'reviews#new', as: 'new_item_review'
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show', as: 'item'

  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch '/reviews/:id', to: 'reviews#update', as: 'review'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/cart', to: 'cart#show'
  post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'

  get '/registration', to: 'users#new', as: :registration

  get '/users', to: 'users#edit', as: :user
  post '/users', to: 'users#create'
  patch '/users', to: 'users#update'

  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  get '/profile/edit_password', to: 'users#edit_password'
  post '/orders', to: 'user/orders#create'
  get '/profile/orders', to: 'user/orders#index'
  get '/profile/orders/:id', to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  get '/merchant/items', to: 'merchant/items#index'
  post '/merchant/items', to: 'merchant/items#create'
  get '/merchant/items/new', to: 'merchant/items#new'
  get '/merchant/items/:id/edit', to: 'merchant/items#edit'
  put '/merchant/items/:id', to: 'merchant/items#update'
  patch '/merchant/items/:id', to: 'merchant/items#update'
  delete '/merchant/items/:id', to: 'merchant/items#destroy'

  namespace :merchant do
    get '/', to: 'dashboard#index', as: :dashboard
    get '/orders/:id', to: 'orders#show', as: :order
    put '/items/:id/change_status', to: 'items#change_status'
    get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
    resources :discounts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/admin/merchants/:id', to: 'admin/merchants#show'
  patch '/admin/merchants/:id', to: 'admin/merchants#update'
  get '/admin/users', to: 'admin/users#index'
  get '/admin/users/:id', to: 'admin/users#show'
  patch '/admin/orders/:id/ship', to: 'admin/orders#ship'
end
