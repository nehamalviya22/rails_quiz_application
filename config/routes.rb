Rails.application.routes.draw do
  
  resources :users
  root to: "quiz#index"
  get '/quiz/information', to: 'quiz#display_info'
  get '/quiz/question', to: 'quiz#show_question'
  post '/quiz/question/:id', to: 'quiz#submit_answer', as: :submit
  get '/quiz/result', to: 'quiz#result'

  #resources :admins
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :questions
  end
  
end

