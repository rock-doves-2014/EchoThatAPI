class CombineEchoBodyText < ActiveRecord::Migration
  def change
    add_column :echos, :body, :text
    remove_column :echos, :user_text, :text
    remove_column :echos, :selected_string, :text
  end
end
