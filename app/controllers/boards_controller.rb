class BoardsController < ApplicationController
  def index
    @boards = Board.all #allは全て取得することになる。（開発時のみ。）
  end

  def new
    @board = Board.new   
  end

  def create
    Board.create(board_params) #保存
  end

  def show
    @board = Board.find(params[:id])  #findメソッドに引数にidを指定すると、そのidに準ずるBoardオブジェクトを取得
  end 

  private  #プライベートメソッド

  def board_params
    params.require(:board).permit(:name, :title, :body) #requireメソッドでモデル名のキーを取得し、permitメソッドでそのモデルのキーを許可する。
  end
end
