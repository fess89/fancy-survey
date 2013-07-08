Megogo::Application.routes.draw do
  
  root :to => "users#index"

  match "users/gifbin" => "users#gifbin"
  match "users/edit" => "users#edit"

  resources :users
end
