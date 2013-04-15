ScholarshipPortal::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  match "/deploy" => "home#deploy", :via => :get
  match "/admin" => "home#admin"
  match "/users/upgrade" => "home#upgrade"
  match "/users/downgrade" => "home#downgrade"
  match "/users/:email/:id" => "home#show", :constraints => {:email => /.*(com|edu)?/, :format => false}
  match "/users/:email" => "home#user", :constraints => {:email => /.*(com|edu)?/, :format => false}

  resources :submissions
end
