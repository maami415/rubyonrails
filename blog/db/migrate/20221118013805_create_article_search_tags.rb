class CreateArticleSearchTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_search_tags do |t|
      t.references :article, null: false, foreign_key: true
      t.references :search_tag, null: false, foreign_key: true
      t.timestamps
    end
    # 記事に同じタグが複数設定出来ない複合ユニークキー制約を設定
    add_index :article_search_tags, [:aricle_id, :search_tag_id], unique: true
  end
end
