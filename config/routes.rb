Rails.application.routes.draw do
  scope 'admin' do
    devise_for :users
    resources :channels do
      resources :products, shallow: true
    end

    devise_scope :user do
      authenticated :user do
        root to: 'dashboard#index',
             as: :authenticated_root
      end

      unauthenticated do
        root to: 'devise/sessions#new',
             as: :unauthenticated_root
      end
    end

    match '/api/bol', to: 'api#bol',
                      as: :api_bol,
                      via: [:get, :post]

    match '/api/ah', to: 'api#ah',
                     as: :api_ah,
                     via: [:get, :post]

    match '/', to: 'dashboard#index',
               as: :dashboard,
               via: :get
  end

  matc '/redirect/:token', to: 'site#redirect',
                           as: :product_redirect_link,
                           via: :get

  root 'site#index'
end
