class BoardsController < ApplicationController
  def index
    @boards = Board.all #allは全て取得することになる。（開発時のみ。）
  end

  def new
    @board = Board.new   
  end

  def create
    board = Board.create(board_params) #保存
    redirect_to board
  end

  def show
    @board = Board.find(params[:id])  #findメソッドに引数にidを指定すると、そのidに準ずるBoardオブジェクトを取得
  end 

  def edit
    @board = Board.find(params[:id]) #編集対象のID
  end

  def update
    board = Board.find(params[:id]) #updateはローカル変数。viewを作成せず、インスタンス変数をviewに渡す必要がないため。
    board.update(board_params)

    redirect_to board  #/boards/:id　のパスにリダイレクトされる。 redirect_to
  end

  def destroy
    board = Board.find(params[:id])
    board.delete

    redirect_to boards_path
  end

  private  #プライベートメソッド

  def board_params
    params.require(:board).permit(:name, :title, :body) #requireメソッドでモデル名のキーを取得し、permitメソッドでそのモデルのキーを許可する。
  end
end
