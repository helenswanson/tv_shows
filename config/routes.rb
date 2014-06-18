TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create] do
    # may not need :new
    resources :characters, only: [:create]
  end

  resources :characters, only: :index
end
