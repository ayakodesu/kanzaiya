Rails.application.routes.draw do

   namespace :admin do



    #get 'general_customers/edit'
    #get 'general_customers/index'
    #get 'general_customers/show'
  end




  namespace :general_public do
    get '/' => 'homes#top'
   get "/home/about" => "homes#about", as: "about"
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   post 'orders/complete' => 'orders#complete'
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'

    resources :orders, only: [:new, :index, :create, :destroy, :show]

    resources :items, only: [:index, :create, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end


    resource :customer, only: [:create, :edit, :show, :update, :destroy]
    get 'unsubscribe/:name' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:name' => 'general_customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:name' => 'general_customer#withdraw'
    get '/customer/index' => 'customers#index', as: 'customers'


    #resources :addresses, only: [:create, :edit, :index, :update, :destroy]
    #delete 'addresses/:id' =>'addresses#destroy', as: 'destroy_address'
    #patch ':id/adderss/:name' => 'addresses#cart_item', as: 'adderss_user'

    resources :addresses, only: [:new, :create, :edit, :index, :update, :destroy]
    delete 'addresses/:id' =>'addresses#destroy', as: 'destroy_address'
    patch ':id/adderss/:name' => 'addresses#cart_item', as: 'adderss_user'

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/:id' =>'cart_items#destroy', as: 'destroy_cart_item'


   resources :favorites, only: [:index]


  end

  namespace :public do

   get '/' => 'homes#top'
   get "/home/about" => "homes#about", as: "about"
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   post 'orders/complete' => 'orders#complete'
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'




  resources :orders, only: [:new, :index, :create, :destroy, :show]

    resources :items, only: [:index, :create, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end



    resource :customer, only: [:create, :edit, :show, :update, :destroy]
    get '/customer/index' => 'customers#index', as: 'customers'
    get 'unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:name' => 'customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:name' => 'customer#withdraw'

    resources :addresses, only: [:new, :create, :edit, :index, :update, :destroy]
    delete 'addresses/:id' =>'addresses#destroy', as: 'destroy_address'
    patch ':id/adderss/:name' => 'addresses#cart_item', as: 'adderss_user'


    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/:id' =>'cart_items#destroy', as: 'destroy_cart_item'

    #resources :favorites, only: [:index, :create, :destroy]
    #delete 'favorites/:id' =>'favorites#destroy', as: 'destroy_favorite'

    resources :favorites, only: [:index]


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


devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
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