Rails.application.routes.draw do
  scope '/admin' do
    devise_for :users
    resources :channels
    resources :products
  end

  root 'site#index'
end
