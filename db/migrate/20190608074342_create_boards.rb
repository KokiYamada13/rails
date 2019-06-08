class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|  #テーブルを作成する。下のブロックの中で定義。|t|は引数。
      t.string :name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end


#このファイルはDBにbordsテーブルを作成する為の定義が記載されている。
#マイグレーションファイル作成後、マイグレーションコマンドを実行して作成される。