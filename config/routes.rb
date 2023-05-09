Rails.application.routes.draw do

  # 管理側
  namespace :admin do
    resources :posts, only: [:show, :index, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    get "search" => "searches#search"
    resources :tags, only: [:create, :destroy]
    resources :communities, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :community_comments, only: [:destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :community_reqs, only: [:index, :show, :edit, :update, :destroy]
    root 'homes#top'
  end

# 顧客側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
   end
   get "search" => "searches#search"
   resources :tags, only: [:create, :destroy]
   resources :communities, only: [:index, :show] do
     resources :community_comments, only: [:create, :destroy]
   end
   resource :community_reqs,only: [:create, :new] do
     get 'thanks' => 'community_reqs#thanks'
   end
   resource :users,only: [] do #resourceはidとindexをpathから取り除ける
     resources :each_users, only: [:show]
     get 'my_page' => 'users#show'
     get 'information/edit' => 'users#edit'
     patch 'information' => 'users#update'
     get 'unsubscribe' =>'users#unsubscribe'
     patch 'withdraw' => 'users#withdraw'
   end
 end

 devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
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
