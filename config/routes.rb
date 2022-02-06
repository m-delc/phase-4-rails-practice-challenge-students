Rails.application.routes.draw do
  resources :students, only: [:index, :update, :destroy, :create]
  resources :instructors, only: [:index, :update, :destroy, :create]



end
