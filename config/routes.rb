Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'main#index'
get 'main/contact' => 'main#contact'  , as: :contact_me
post 'main/contact_send' => 'main#contact_send' , as: :contact_send

end
