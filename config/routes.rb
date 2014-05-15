GenevarbPres11062014::Application.routes.draw do
  resources :brigades, only: :index

  root to: "brigades#index"
end
