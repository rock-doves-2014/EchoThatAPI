class User < ActiveRecord::Base
  has_many :echos

  def drafts
    echos.select{|e| e.is_draft}
  end

  def twitter_history
    echos.select{|e| e.sent_to_venue.downcase == "twitter"}
  end
end
