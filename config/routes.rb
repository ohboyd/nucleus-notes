Rails.application.routes.draw do
  devise_for :users, :path_names => {
    :verify_authy => "/verify_token",
    :enable_authy => "/enable_two_factor",
    :verify_authy_installation => "/verify_installation",
    :authy_onetouch_status => "/onetouch_status"
  }

  get 'welcome/index'

  resources :notes do
    member do
      patch :complete
    end
  end

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
  end

  root 'welcome#index'
end
