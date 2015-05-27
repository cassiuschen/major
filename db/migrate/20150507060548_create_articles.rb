class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :content
      t.string :title
      t.integer :rank

      t.timestamps null: false
    end
  end
end
