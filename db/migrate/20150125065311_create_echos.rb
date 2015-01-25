class CreateEchos < ActiveRecord::Migration
  def change
    create_table :echos do |t|
      t.references :user
      t.string :sent_to_venue
      t.text :user_text
      t.text :selected_string
      t.string :long_url
      t.string :short_url
      t.boolean :is_draft
    end
  end
end

