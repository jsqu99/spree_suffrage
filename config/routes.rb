Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :polls do
      member do
        resources :poll_answers
      end
    end
  end

  get '/poll_results/:poll_id', :to => 'poll_results#show', :as => :poll_results

  post '/vote', :to => 'votes#vote', :as => :vote
end
