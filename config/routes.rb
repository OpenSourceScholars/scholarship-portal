ScholarshipPortal::Application.routes.draw do

  devise_for :admins

  root :to => "home#index"

  match "/admin" => "home#admin"
  match "/users/show/:email" => "home#user", :constraints => {:email => /.*(com)?/, :format => false}

  resources :submissions

  devise_for :users

end
