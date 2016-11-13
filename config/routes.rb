Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/lemonaids' => 'lemonaids#index'
  get '/lemonaids/new' => 'lemonaids#new'
  post '/lemonaids' => 'lemonaids#create'
  get '/lemonaids/:id' => 'lemonaids#show' 
  get '/lemonaids/:id/edit' => 'lemonaids#edit'
  patch '/lemonaids/:id' => 'lemonaids#update'
  delete '/lemonaids/:id' => 'lemonaids#destroy'
end

  

