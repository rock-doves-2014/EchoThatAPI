class AddChromeTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chrome_token, :string
    add_index :users, :chrome_token, unique: true
  end
end
