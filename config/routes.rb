Rails.application.routes.draw do
  devise_for :users
  root to: "menus#top"
  resources :menus do
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get 'top'
      get 'praise'
    end
  end
  resources :users do
    collection do
      get 'bookmarks'
    end
  end
  resources :refrigerators do
    collection do
      get 'search'
      get 'empty'
    end
  end
end
