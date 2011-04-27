Wednesday::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions"}

  resources :ideas
  
  root :to => "ideas#index"
end
