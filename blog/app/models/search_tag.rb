class SearchTag < ApplicationRecord
    # search_tag削除時、中間テーブルも削除
    has_many :article_search_tags, dependent: :destroy
    has_many :articles, through: :article_search_tags
    # 空白登録NG、重複登録NG
    validates :name, presence: true, uniqueness: true
end
