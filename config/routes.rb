Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "recipes#index"
  resources :recipes, only:[:index, :create, :new, :show, :edit, :destroy, :update] do
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  get :only, 'categories/search'
  resources :users, only: :show
  post 'recipes/:id' => 'recipes#update'
end
