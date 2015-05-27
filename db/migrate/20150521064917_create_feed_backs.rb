class CreateFeedBacks < ActiveRecord::Migration
  def change
    create_table :feed_backs do |t|
      t.boolean :done, default: false
      t.text :content
      t.string :sender, default: "system"
      t.string :contact

      t.timestamps null: false
    end
  end
end
