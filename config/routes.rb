Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "menus#top"
  resources :menus do
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get 'top'
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
  namespace :administrator do
    resources :refrigerators
  end

end
