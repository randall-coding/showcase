Rails.application.routes.draw do
  devise_for :users, skip: [:sign_up, :registration]

  root 'main#index'

  ActiveAdmin.routes(self)

  get 'admins/sign_in'
  get 'portfolio_items/index'
  get 'portfolio_items/new'
  get 'portfolio_items/create'
  get 'portfolio_items/edit'
  get 'portfolio_items/update'
  get 'portfolio_items/destroy'

  get '/portfolio' => 'main#portfolio', as: :portfolio
  get '/aboutme' => 'main#aboutme', as: :aboutme
  get 'main/contact' => 'main#contact'  , as: :contact_me
  post 'main/contact_send' => 'main#contact_send' , as: :contact_send

  get 'api/ethereum' => 'transaction#index' , as: :ethereum
  post 'api/ethereum' => 'transaction#index' , as: :ethereum_post

  get '/portfolio_item/new' => 'portfolio_items#new', as: :portfolio_item
  post '/portfolio_tem/new' => 'portfolio_items#create', as: :portfolio_items

  get '/react/task-manager' => 'react_task_manager#index', as: :task_manager
end
