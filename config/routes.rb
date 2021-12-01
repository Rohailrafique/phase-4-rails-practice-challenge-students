Rails.application.routes.draw do
  resources :instructors, only: [:create, :index, :update, :destroy]
  resources :students, only: [:create, :index, :update, :destroy]
end
