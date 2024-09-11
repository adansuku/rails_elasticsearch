class CreateArticles < ActiveRecord::Migration[6.1]
  def up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :category
      t.datetime :published_at

      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
