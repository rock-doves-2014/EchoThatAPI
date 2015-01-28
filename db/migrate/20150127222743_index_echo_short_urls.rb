class IndexEchoShortUrls < ActiveRecord::Migration
  def change
    add_index :echos, :short_url, unique: true
  end
end
