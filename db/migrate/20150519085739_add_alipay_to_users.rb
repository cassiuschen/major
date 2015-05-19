class AddAlipayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alipay_account, :string
  end
end
