class AddGoogleCredentialsToUsers < ActiveRecord::Migration
  def change
     add_column :users, :google_credentials, :text
  end
end
