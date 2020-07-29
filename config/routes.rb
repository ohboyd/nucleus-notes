Rails.application.routes.draw do
  devise_for :users, :path_names => {
    :verify_authy => "/verify-token",
    :enable_authy => "/enable-two-factor",
    :verify_authy_installation => "/verify-installation",
    :authy_onetouch_status => "/onetouch-status"
  }

  get 'welcome/index'

  resources :notes

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
  end

  root 'welcome#index'
end
