Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'gifts#vote'
  resources :gifts do
    collection do
      get :results
      get :vote
    end
    member do
      post :upvote
      post :downvote
    end
  end
end
