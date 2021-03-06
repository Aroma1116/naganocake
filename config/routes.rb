Rails.application.routes.draw do
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  get '/admin', to: 'admin/homes#top'
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show]
    patch '/orders/:id', to: 'orders#update', as: "orders_update"
    patch '/order_details/:id', to: 'order_details#update', as: "orderdetails"
  end
  #顧客用
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
  root to: 'customer/homes#top'
  namespace :customer do
    get '/my_page', to: 'customers#show'
    get '/edit', to: 'customers#edit', as: "customer_edit"
    patch '/customers', to: 'customers#update'
    get '/unsubscribed', to: 'customers#unsubscribed'
    patch '/withdraw', to: 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/destroy_all', to: 'cart_items#destroy_all'
    resources :addresses, only: [:index, :create, :edit, :update]
    delete '/address/:id', to: 'addresses#destroy'
    resources :orders, only: [:new, :index]
    post '/orders/confirm', to: 'orders#confirm'
    post '/orders', to: 'orders#create', as: 'order_create'
    get '/orders/complete', to: 'orders#complete'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
