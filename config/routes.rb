Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root "home#index"

  post '/zip', :to => "guides#zip", :as => "zip"
  
  devise_for :users
  ActiveAdmin.routes(self)

  resources :guides
  
  resources :places

end
