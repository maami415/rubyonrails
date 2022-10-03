class Comment < ApplicationRecord
  include Visible

  belongs_to :article # Active Recordの関連付け
end
