class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name, null: false
      t.text :desc
      t.string :code
      t.belongs_to :college, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
