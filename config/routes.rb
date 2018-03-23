Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => { :format => :json } do

 	resources :user

	get '/user/show' => 'user#show', :as => 'showUser'
    post '/user/register' => 'user#register', :as => 'register'
    post '/user/login' => 'user#login', :as => 'login'

    resources :item

    get '/item/show' => 'item#show', :as => 'showItem'
    post '/item/addItem' => 'item#addItem', :as => 'addItem'
    post '/item/editItem' => 'item#editItem', :as => 'editItem'
    post '/item/borrowItem' => 'item#borrowItem', :as => 'borrowItem'
    post '/item/returnItem' => 'item#returnItem', :as => 'returnItem'
    post '/item/searchBorrowedItem' => 'item#searchBorrowedItem', :as => 'searchBorrowedItem'
    post '/item/listBorrowedItem' => 'item#listBorrowedItem', :as => 'listBorrowedItem'
    

  end

end
