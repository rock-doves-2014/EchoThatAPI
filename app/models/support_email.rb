class SupportEmail < ActiveRecord::Base
  validates_presence_of :sender, :recipient, :body

end
