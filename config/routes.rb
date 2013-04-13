ScholarshipPortal::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  match "/admin" => "home#admin"
  match "/users/upgrade/:email/:id" => "home#upgrade", :constraints => {:email => /.*(com)?/, :format => false}
  match "/users/:email/:id" => "home#show", :constraints => {:email => /.*(com)?/, :format => false}
  match "/users/:email" => "home#user", :constraints => {:email => /.*(com)?/, :format => false}

  resources :submissions
end
