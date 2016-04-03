Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :timelines do
    resources :steps, shallow: true do
      member do
        post 'up'
        post 'down'
      end
    end
  end
end
