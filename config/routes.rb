Rails.application.routes.draw do
  resources :ninjas do
	member do
		put :checkin_ninja
		put :checkin_mentor
	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
