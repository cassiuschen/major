class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :public, :bool, default: false
    add_column :users, :sexal, :integer, default: 0
    add_reference :users, :major, index: true, foreign_key: true
    add_column :users, :role, :integer, default: 0
    add_column :users, :desc, :text
    add_column :users, :avatar, :string
  end
end
