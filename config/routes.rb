Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/lemonaids' => 'lemonaids#index'
  get '/lemonaids/new' => 'lemonaids#new'
  post '/lemonaids' => 'lemonaids#create'
  get '/lemonaids/:id' => 'lemonaids#show' 
  get '/lemonaids/:id/edit' => 'lemonaids#edit'
  patch '/lemonaids/:id' => 'lemonaids#update'
  delete '/lemonaids/:id' => 'lemonaids#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

end




  

