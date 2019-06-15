Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'boards#index'
  get 'boards', to: 'boards#index'   #GETメソッドで/boardsにリクエストが来た場合、indexメソッドが呼ばれる。
  get 'boards/new', to: 'boards#new'    #GETメソッドで/boards/newにリクエストが来た場合、newメソッドが呼ばれる。
  post 'boards', to: 'boards#create'
  get 'boards/:id', to: 'boards#show'  #idが入る部分は　:idとする
end
