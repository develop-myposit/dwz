Learn30::Application.routes.draw do

  resources :categories
resources :links do
     collection do
        match 'list', :via => [:get]
     end
  resources :links
  
  end

  devise_for :users, :path_prefix => 'goo', path_names: {sign_in: "login", sign_out: "logout"}
# resources :users, :only =>[:show, :index]
  resources :users
  resources :pages
  match ':name' => 'viewer#show', :as => :view_page

  authenticated :user do
     root :to => "viewer#show", :defaults => { :name => "home"}
  end
  root :to => "viewer#show", :defaults => { :name => "home"}
end
