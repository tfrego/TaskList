Rails.application.routes.draw do

  root 'tasks#index'
  patch '/tasks/:id/index', to: 'tasks#complete', as: 'complete_task'
  resources :tasks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
