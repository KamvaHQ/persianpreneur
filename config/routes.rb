Rails.application.routes.draw do

	root to: "people#index"
  resources :people do
    collection { post :sort }
  end
  resources :admins
  resource :admin_sessions, only: [:new, :create, :destroy]
  get 'admin/manage/people' => 'admins#manage'
  get 'admin/manage/admins' => 'admins#index'
  get '/admin/login' => 'admin_sessions#new'
  get '/admin/logout' => 'admin_sessions#destroy'
  get '/admin/review', :to => 'admins#review'
  match '/people/:id/destroy' => 'people#destroy', via: [:delete]
  match '/admins/:id/destroy' => 'admins#destroy', via: [:delete]
  match '/admin/publish/:id' => 'admins#publish', via: [:get]

end
