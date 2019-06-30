class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]   #先に実行したいメソッドは beforre_action。対象を絞り込みたい場合はルートの書き方と同じようにonly

  def index #allは全て取得することになる。（開発時のみ。）
    @boards = Board.page(params[:page]) #kaminaririによりpageメソッドが利用可。引数に指定したページに表示するデータを取得する。デフォルトは２５p
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params) #保存
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"  #flash[:notice]でデータがsessionに保存され、一度参照したら削除される。
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
    @board.attributes = flash[:board] if flash[:board]
  end

  def update #updateはローカル変数。viewを作成せず、インスタンス変数をviewに渡す必要がないため。
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
    #@board.update(board_params)
    #redirect_to @board  #/boards/:id　のパスにリダイレクトされる。 redirect_to
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private  #プライベートメソッド

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: []) #requireメソッドでモデル名のキーを取得し、permitメソッドでそのモデルのキーを許可する。
  end

  def set_target_board
    @board = Board.find(params[:id]) #findメソッドに引数にidを指定すると、そのidに準ずるBoardオブジェクトを取得。
  end
end
