class AddTimestampsToAll < ActiveRecord::Migration
  def change
    add_column :echos, :created_at, :datetime
    add_column :echos, :updated_at, :datetime

    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
  end
end
