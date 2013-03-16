ProfilePics::Application.routes.draw do

  devise_for :users
  match '/auth/:provider/callback' => 'authentications#create'
  root :to => "site#index"
  match '/auth/failure' => "site#index"


end
