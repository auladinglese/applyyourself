Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :resumes
  devise_for :users
  root 'pages#home'
  get 'pages/privacy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
