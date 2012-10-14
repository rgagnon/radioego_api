RegoApi::Application.routes.draw do
  resources :audios, :only => [:index, :show]
end
