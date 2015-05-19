class CreateSecondGradeDisciplines < ActiveRecord::Migration
  def change
    create_table :second_grade_disciplines do |t|
      t.string :name
      t.string :code
      t.belongs_to :first_grade_discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
