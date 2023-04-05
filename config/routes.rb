Rails.application.routes.draw do

  # 管理側
  namespace :admin do
    resources :posts, only: [:show, :index, :destroy]
    resources :communities, only: [:index, :show, :new, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :community_requests, only: [:index, :show, :edit, :update]
    root 'homes#top'
  end

# 顧客側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   resources :posts
   resources :communities, only: [:index, :show]
   resource :users,only: [] do #resourceはidとindexをpathから取り除ける
     get 'my_page' => 'users#show'
     get 'information/edit' => 'users#edit'
     patch 'information' => 'users#update'
     get 'unsubscribe' =>'users#unsubscribe'
     patch 'withdraw' => 'users#withdraw'
   end
   resources :community_requests,only: [:index, :show,]
 end


devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
