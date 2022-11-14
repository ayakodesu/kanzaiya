Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :general_public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :general_customers
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
