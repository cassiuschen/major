class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :logo
      t.text :desc

      t.timestamps null: false
    end
  end
end
