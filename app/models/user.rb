class User < ActiveRecord::Base
  has_many :echos
end