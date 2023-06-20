Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :questions do
    resources :answers
  end
end
