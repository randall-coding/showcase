Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'main#index'
get '/portfolio' => 'main#portfolio', as: :portfolio
get '/aboutme' => 'main#aboutme', as: :aboutme
get 'main/contact' => 'main#contact'  , as: :contact_me
post 'main/contact_send' => 'main#contact_send' , as: :contact_send

get 'api/ethereum' => 'transaction#index' , as: :ethereum
post 'api/ethereum' => 'transaction#index' , as: :ethereum_post

end
