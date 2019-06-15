Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'boards#index'
  
  resources :boards, only: [:index, :new, :create, :show, :edit, :update]   # 個々にルートを作成したが、リソースベースルーティングで基本のルーティングを１行で済ませる。onlyで指定する。


  #get 'boards', to: 'boards#index'   #GETメソッドで/boardsにリクエストが来た場合、indexメソッドが呼ばれる。
  #get 'boards/new', to: 'boards#new'    #GETメソッドで/boards/newにリクエストが来た場合、newメソッドが呼ばれる。
  #post 'boards', to: 'boards#create'
  #get 'boards/:id', to: 'boards#show'  #idが入る部分は　:idとする
end
