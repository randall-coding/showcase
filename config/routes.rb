Rails.application.routes.draw do
  get 'admins/sign_in'
  get 'portfolio_items/index'
  get 'portfolio_items/new'
  get 'portfolio_items/create'
  get 'portfolio_items/edit'
  get 'portfolio_items/update'
  get 'portfolio_items/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'main#index'
get '/portfolio' => 'main#portfolio', as: :portfolio
get '/aboutme' => 'main#aboutme', as: :aboutme
get 'main/contact' => 'main#contact'  , as: :contact_me
post 'main/contact_send' => 'main#contact_send' , as: :contact_send

get 'api/ethereum' => 'transaction#index' , as: :ethereum
post 'api/ethereum' => 'transaction#index' , as: :ethereum_post

get '/sign_in' => 'admins#sign_in' , as: :admin_sign_in
post '/sign_in' => 'admins#create_session', as: :admin_create_session

get '/portfolio_item/new' => 'portfolio_items#new', as: :portfolio_item
post '/portfolio_tem/new' => 'portfolio_items#create', as: :portfolio_items

end
