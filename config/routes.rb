Rails.application.routes.draw do
  get '/evaluator/new' => 'evaluator#new'
  post 'evaluator' => 'evaluator#create'
end
