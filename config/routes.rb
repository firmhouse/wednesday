Wednesday::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}

  resources :ideas
  
  root :to => "ideas#index"
end
