Rails.application.routes.draw do
  get 'contact/index', to: 'contact#index', as: :contact
  get 'about/index', to: 'about#index', as: :about
  get 'gallery/index', to: 'gallery#index', as: :gallery
  get 'index/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
end
