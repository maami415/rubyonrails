class Comment < ApplicationRecord
  belongs_to :article # Active Recordの関連付け
end
