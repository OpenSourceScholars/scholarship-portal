ScholarshipPortal::Application.routes.draw do

  devise_for :admins

  root :to => "home#index"

  match "/admin" => "home#admin"

  resources :submissions

  devise_for :users

end
