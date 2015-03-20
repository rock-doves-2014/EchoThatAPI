class CreateSupportEmails < ActiveRecord::Migration
  def change
    create_table :support_emails do |t|
      t.string    :subject
      t.text      :body, null: false
      t.string    :sender, null: false
      t.string    :recipient, null: false
      t.datetime  :sent_on
      t.timestamps null: false
    end
  end
end
