class EchoSendToVenueLabel < ActiveRecord::Migration
  def change
    remove_column :echos, :sent_to_account, :string
    add_column :echos, :send_to_venue, :string
  end
end
