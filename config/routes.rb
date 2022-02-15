Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users' => 'users#index'
  get 'users' => 'users#show'
  get 'users' => 'users#new'
  post 'users' => 'users#create'
  get 'users' => 'users#edit'
  put 'users' => 'users#update'
  delete 'users' => 'users#destroy'
end
