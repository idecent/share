Share::Application.routes.draw do
  root :to => 'home#index'
  match "share" => "home#share"
  match "share_to" => "home#share_to"
  
  namespace :admin do
    root :to => 'home#index'
    resources :urls
    resources :sources do
      resources :urls
    end
  end
end
