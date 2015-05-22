class AddTagsToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :tag, :string
  end
end
