class CreateFirstGradeDisciplines < ActiveRecord::Migration
  def change
    create_table :first_grade_disciplines do |t|
      t.string :name
      t.string :code
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
