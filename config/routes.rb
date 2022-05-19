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
  end
  #顧客用
  get '/customers/edit', to: 'customer/customers#edit', as: "customer_edit"
  patch '/customers', to: 'customer/customers#update'
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }
  root to: 'customer/homes#top'
  get '/customers/my_page', to: 'customer/customers#show'
  get '/customers/unsubscribed', to: 'customer/customers#unsubscribed'
  patch '/customers/withdraw', to: 'customer/customers#withdraw'
  namespace :customer do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/destroy_all', to: 'cart_items#destroy_all'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
