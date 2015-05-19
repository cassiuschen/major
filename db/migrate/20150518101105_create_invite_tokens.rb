class CreateInviteTokens < ActiveRecord::Migration
  def change
    create_table :invite_tokens do |t|
      t.string :token, null: false
      t.integer :limit, default: 5

      t.timestamps null: false
    end
  end
end
