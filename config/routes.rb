Rails.application.routes.draw do
  devise_for :users
  root to: "menus#top"
  resources :item do
    collection do
      get 'top'
    end
  end
end
