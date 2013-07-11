Hiyoung::Application.routes.draw do
  get "study/index"

  get "study/topic"

  get "study/essay"

  get "study/write"

  get "study/read"

  get "study/comment"

  match ':controller(/:action(/:id))(.:format)'
	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
end
