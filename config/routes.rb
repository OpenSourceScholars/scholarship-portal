ScholarshipPortal::Application.routes.draw do

  root :to => "home#index"

  resources :submissions

  devise_for :users

end
