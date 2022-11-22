class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
    has_many :article_tags
    has_many :tags, through: :article_tags

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    # tags_saveメソッドの定義
    def tags_save(tag_list)
        # すでにタグ付け登録していた場合、紐付いているタグをすべて削除    
        if self.tags != nil
            article_tags_records = ArticleTag.where(article_id: self.id)
            article_tags_records.destroy_all
        end
        # aritcleにtagを紐付ける
        tag_list.each do |tag|
            inspected_tag = Tag.where(tag_name: tag).first_or_create
            self.tags << inspected_tag
        end
    end
end