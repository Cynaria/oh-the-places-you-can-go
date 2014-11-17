Rails.application.routes.draw do
  root "home#index"

  post '/zip', :to => "guides#zip", :as => "zip"
  
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :guides
  
  resources :places

end
