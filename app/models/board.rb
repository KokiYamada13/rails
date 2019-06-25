class Board < ApplicationRecord
    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
end

#バリデーション処理。presenceは必須入力かどうか。