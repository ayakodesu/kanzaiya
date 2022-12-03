Rails.application.routes.draw do
  namespace :admin do
    get 'general_customers/edit'
    get 'general_customers/index'
    get 'general_customers/show'
  end
  namespace :general_public do
    get '/' => 'homes#top'
    get "/home/about" => "homes#about", as: "about"

    resources :orders, only: [:new, :index, :create, :destroy, :show]
    resources :items, only: [:index, :create, :show, :update, :destroy]
    resource :customer, only: [:create, :edit, :show, :update, :destroy]
    get 'general_customers' => 'general_customers#index'
    resources :addresses, only: [:create, :edit, :index, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :favorites, only: [:index, :create, :destroy]


  end

  namespace :public do

   get '/' => 'homes#top'
   get "/home/about" => "homes#about", as: "about"
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   post 'orders/complete' => 'orders#complete'

    resources :orders, only: [:new, :index, :create, :destroy, :show]

    resources :items, only: [:index, :create, :show, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resource :customer, only: [:create, :edit, :show, :update, :destroy]
    get 'customers' => 'customers#index'
    patch ':id/withdraw/:name' => 'customers#withdraw', as: 'withdraw_user'

    resources :addresses, only: [:create, :edit, :index, :update, :destroy]
    delete 'addresses/:id' =>'addresses#destroy', as: 'destroy_address'
    patch ':id/adderss/:name' => 'addresses#cart_item', as: 'adderss_user'

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/:id' =>'cart_items#destroy', as: 'destroy_cart_item'

    resources :favorites, only: [:index, :create, :destroy]

  end


  namespace :admin do
    get 'top' => 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    resources :homes, only: [:new, :index, :create, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    get 'genres/edit/:id' => 'genres#edit'
    resources :items, only: [:new, :index, :create, :edit, :show, :update, :destroy]
    resources :orders, only: [:show, :index]
    resources :customers, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :general_customers, only: [:index, :show, :create, :edit, :update, :destroy]





  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  devise_for :general_customers,skip: [:passwords], controllers: {
  registrations: "general_public/registrations",
  sessions: 'general_public/sessions'
}


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
