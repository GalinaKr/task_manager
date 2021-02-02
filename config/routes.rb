Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :projects
  resources :tasks do
    put :status
  end

  post 'add_project', to: 'main#add_project'
  post 'add_task', to: 'main#add_task'
  post 'update_task', to: 'main#update_task'
  post 'update_project', to: 'main#update_project'

end
