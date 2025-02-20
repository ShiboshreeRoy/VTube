Rails.application.routes.draw do
  devise_for :users
  resources :videos do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  root "videos#index"
end
