class AddDisciplineIdToMajors < ActiveRecord::Migration
  def change
    add_reference :majors, :discipline, index: true, foreign_key: true
  end
end
