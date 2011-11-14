Share::Application.routes.draw do
  root :to => 'home#index'
  match "share" => "home#share"
  match "share_to" => "home#share_to"
  
  namespace :admin do
    root :to => 'home#index'
    resources :sources
  end
end
