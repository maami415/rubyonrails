class Article < ApplicationRecord
    include Visible

    has_many :comments # 関連付けるモデルの指定
  
    validates :title, presence: true # titleが存在するか検証
    validates :body, presence: true, length: { minimum: 10 } # bodyが存在する、かつ10文字以上か検証
end