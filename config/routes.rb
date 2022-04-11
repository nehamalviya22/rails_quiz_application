Rails.application.routes.draw do
  
  root to: "admins#index"
  #resources :admins
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :questions
  end
  
end

