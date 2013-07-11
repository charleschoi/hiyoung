Hiyoung::Application.routes.draw do
  match ':controller(/:action(/:id))(.:format)'
	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
end
