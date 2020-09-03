Rails.application.routes.draw do
  devise_for :users
  root to: "menus#top"
  resources :menus do
    collection do
      get 'top'
    end
  end
  resources :users
end
