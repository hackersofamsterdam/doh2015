Rails.application.routes.draw do
  scope '/admin' do
    devise_for :users
    resources :channels do
      resources :products
    end
  end

  root 'site#index'
end
