Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#index'
  post '/sessions/login' => 'sessions#login'
  get '/users/register' => 'users#register'
  post '/users/create'  => 'users#create'
  delete '/users/:user_id/logout' => 'sessions#destroy'

  get '/users/:user_id/allgroups' => 'groups#allgroups'
  post '/users/:user_id/newgroup' => 'groups#newgroup'
  get '/groups/:group_id/group_info' => 'groups#group_info'


  post '/groups/:group_id/join' => 'groups#join'
  post '/groups/:group_id/leave' => 'groups#leave'
  delete '/groups/:group_id/delete' => 'groups#delete'

end

  # post '/users/:user_id/like/:secret_id' => 'secrets#like'
  # post '/users/:user_id/unlike/:secret_id' => 'secrets#unlike'
  # delete '/users/:user_id/delete/:secret_id' => 'secrets#delete'
  # get '/users/:user_id/usersecrets' => 'secrets#user_secrets'
  # post '/users/:user_id/newsecret' => 'secrets#create_secret'