class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :mobile
      t.string :wechat
      t.string :qq
      t.string :skype
      t.string :email

      t.timestamps null: false
    end
  end
end
