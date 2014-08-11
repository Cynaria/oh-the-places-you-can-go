Rails.application.routes.draw do
  root "home#index"

  post '/zip', :to => "guides#zip", :as => "zip"
  
  devise_for :users

  resources :guides
  
  resources :places

end
