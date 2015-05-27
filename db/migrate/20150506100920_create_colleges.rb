class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.text :desc
      t.belongs_to :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
