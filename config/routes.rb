Rails.application.routes.draw do
  root 'articles#index'
  resources :articles
  resources :users
  get '/iframe' => 'articles#iframe'
  # post '/trucking_applicants' => 'applicants#trucking_applicants'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
