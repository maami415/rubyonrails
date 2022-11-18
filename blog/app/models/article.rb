class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
    has_many :article_search_tags, dependent: :destroy
    has_many :search_tags, through: :article_search_tags

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end