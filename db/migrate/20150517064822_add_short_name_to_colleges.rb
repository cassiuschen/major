class AddShortNameToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :short_name, :string, null: false
  end
end
