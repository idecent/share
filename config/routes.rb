Share::Application.routes.draw do
  root :to => 'home#index'
  match "share" => "home#share"
  
  namespace :admin do
    root :to => 'home#index'
    resources :sources
  end
end
