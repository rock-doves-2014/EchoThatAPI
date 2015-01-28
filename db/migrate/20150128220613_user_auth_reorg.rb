class UserAuthReorg < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_acct, :string
    remove_column :users, :facebook_acct, :string
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_token_secret, :string
  end
end
