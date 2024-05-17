Rails.application.routes.draw do 
  get "up" => "rails/health#show", as: :rails_health_check

  # scope, namespace, moduleの違い
  # https://qiita.com/ryosuketter/items/9240d8c2561b5989f049
  scope :api do
    resources :entries, only: [:show, :create, :update, :destroy] do
      get '/existing', to: 'entries#show'
      put '/update', to: 'entries#update'
      delete '/confirm', to: 'entries#destroy'
    end
  end

end
