Rottenpotatoes::Application.routes.draw do
  resources :movies
  # post '/movies/search_by_director'
	match "/movies/search_by_director/:director", :to => "movies#search_by_director", :as => "search_by_director"
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
