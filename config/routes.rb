Rails.application.routes.draw do
  get 'settings' => 'settings#index'
  post 'settings/password'

  resources :categories
  root 'home#index'

  get 'admin' => 'admin#index'
  get 'admin/bosses', as: :bosses
  post 'admin/bosses' => 'admin#set_employees'
  get 'admin/projects'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'

  post 'projects/prioritize' => 'projects#update_priorities'
  get 'projects/completed' => 'projects#completed'
  get 'projects/all' => 'projects#all'

  resources :users
  resources :projects
end

