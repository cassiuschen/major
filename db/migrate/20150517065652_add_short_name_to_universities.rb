class AddShortNameToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :short_name, :string, null: false, uniq: true
  end
end
