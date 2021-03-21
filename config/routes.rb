Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :models

  namespace :customers do
    root 'products#top'
    get '/about' => 'products#about'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create]
    get 'customers/orders/log' => 'orders#log'
    get 'customers/orders/thanx' => 'orders#thanx'
    resources :cart_products, only: [:index, :update, :create, :destroy]
    get 'cart_products/all_destroy' => 'cart_products#all_destroy'
    resources :products, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/quit' => 'customers#quit'
    get 'customers/out' => 'customers#out'
  end


  namespace :admins do
    root 'products#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get 'order_products/update'
  end



  devise_for :customers, controllers: {
        sessions: 'customers/sessions',
        registrations: 'customers/registrations',
        passwords: 'customers/passwords'
  }

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations',
        passwords: 'admins/passwords'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
