class RenameEchoVenueColumn < ActiveRecord::Migration
  def change
    add_column :echos, :sent_to_account, :string
    remove_column :echos, :sent_to_venue, :string
  end
end
