Rails.application.routes.draw do
  get 'greetings/hello'

  resources :articles
  resources :contacts

  root 'greetings#hello'

end
