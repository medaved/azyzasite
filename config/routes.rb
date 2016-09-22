Rails.application.routes.draw do
  resources :galleries, only: [:index, :show]
  # resources :images, only: [:index, :show]
  #mount root
  root to: 'index#home'

  mount RailsAdmin::Engine => '/admino4ka', as: 'rails_admin'

  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
  get '/contacts', to: redirect('contact')

  get 'index/media/*.*', to: redirect('/media/*.*')

  scope module: :index do
    get :home
    get :faq
    get :blog
    get :shop
  end

end
