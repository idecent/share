Share::Application.routes.draw do
  root :to => 'home#index'
  match "share" => "home#share"
end
