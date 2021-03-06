Rails.application.routes.draw do
  devise_for :models

  scope module: :customers do
    root 'products#top'
    get '/about' => 'products#about'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create]
    get 'customers/orders/log' => 'orders#log'
    get 'customers/orders/thanx' => 'orders#thanx'
    delete 'cart_products/all_destroy' => 'cart_products#all_destroy'
    resources :cart_products, only: [:index, :update, :create, :destroy]
    resources :products, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
  end


  namespace :admins do
    root 'products#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
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
