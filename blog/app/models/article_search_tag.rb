class ArticleSearchTag < ApplicationRecord
    belongs_to :article
    belongs_to :search_tag
end
